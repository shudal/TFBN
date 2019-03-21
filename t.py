import tensorflow as tf
import numpy as np
import matplotlib.pyplot as plt
import pymysql
import datetime

rng = np.random

# Parameters
learning_rate = 0.01
training_epochs = 5000
display_step = 50


# tf Graph Input
X = tf.placeholder(tf.float32)
Y = tf.placeholder(tf.float32)

# Set model weights
W = tf.Variable(rng.randn(), name="weight")
b = tf.Variable(rng.randn(), name="bias")

# Construct a linear model
pred = tf.add(tf.multiply(X, W), b)

# Initialize the variables (i.e. assign their default value)
init = tf.global_variables_initializer()


db_config = {"host" : "127.0.0.1", "port" : 3306, "user" : "root", "password" : "Qw123456_", "db" : "bill"}
db = pymysql.connect(host = db_config['host'], port = db_config['port'], user = db_config['user'], password = db_config['password'], db = db_config['db'], charset = 'utf8mb4')
cursor = db.cursor()

sql_get_users = "select id from user where status='1'";
cursor.execute(sql_get_users)
users = cursor.fetchall();

from hashlib import sha1
import requests
for i in range(0, len(users)):
    userid = users[i][0];
    print("Userid = " + str(userid))
    sql_get_usermeta = "select month_fee,month_used from user_meta where user_id='" + str(userid) + "'"
    cursor.execute(sql_get_usermeta)
    the_user_meta = cursor.fetchone()
    if the_user_meta is None:
        continue
    month_fee = the_user_meta[0]
    month_used = the_user_meta[1]
    
    print("     month_fee=" + str(month_fee))

    sql_get_bills = "select year,month,day,io,sum from bill where user_id='" + str(userid) + "'"
    cursor.execute(sql_get_bills)
    bills = cursor.fetchall()
    #print("     bills=" + str(bills))

    r_X = []
    r_Y = []

    alldays = {}
    for i in range(0, len(bills)):
        the_day = str(bills[i][0])
        
        if(bills[i][1] < 10):
            the_day = the_day + "0"
        the_day = the_day + str(bills[i][1])
        
        if (bills[i][2] < 10):
            the_day = the_day + "0"
        the_day = the_day + str(bills[i][2])

        if the_day in alldays.keys():
            if (bills[i][3] == "out"):
                alldays[the_day]['sum'] = alldays[the_day]['sum'] - bills[i][4]
            else:
                alldays[the_day]['sum'] = alldays[the_day]['sum'] + bills[i][4]
        else:
            a_day = {'sum' : bills[i][4]}
            alldays[the_day] = a_day

    for key in alldays:
        day = key[-2:]
        day = int(day)
       
        if (alldays[key]['sum'] >= 0 and alldays[key]['sum'] <= 30):
            continue
        
        r_X.append(day)
        r_Y.append(alldays[key]['sum'])
    # Training Data
    # print(alldays)
    if (len(alldays) < 10):
        continue
    print(r_X)
    print(r_Y)
    train_X = np.asarray(r_X)
    train_Y = np.asarray(r_Y)
    n_samples = train_X.shape[0]


    # Mean squared error
    cost = tf.reduce_sum(tf.pow(pred-Y, 2))/(2*n_samples)
    # Gradient descent
    #  Note, minimize() knows to modify W and b because Variable objects are trainable=True by default
    optimizer = tf.train.GradientDescentOptimizer(learning_rate).minimize(cost)


    with tf.Session() as sess:
        sess.run(init)
        for epoch in range(training_epochs):
            for (x, y) in zip(train_X, train_Y):
                sess.run(optimizer, feed_dict={X: x, Y: y})
            if (epoch+1) % display_step == 0:
                c = sess.run(cost, feed_dict={X: train_X, Y:train_Y})
        print("     Optimization Finished!")
        training_cost = sess.run(cost, feed_dict={X: train_X, Y: train_Y})
        plt.plot(train_X, train_Y, 'ro', label='Original data')
        plt.plot(train_X, sess.run(W) * train_X + sess.run(b), label='Fitted line')
        plt.legend()
        plt.show()
        rw = sess.run(W)
        rb = sess.run(b)
        rw = float(str(rw))
        rb = float(str(rb))

        print("     Final w=" + str(rw))
        print("     Final b=" + str(rb))
    the_today = datetime.date.today()
    the_today = the_today.strftime('%y%m%d')

    the_year = the_today[-6:-4]
    the_year = int(the_year)

    year = the_year

    the_month = the_today[-4:-2]
    the_month = int(the_month)

    month = the_month
    the_today = the_today[-2:]
    the_today = int(the_today)

    day = the_today
    print(year)
    print(month)
    print(day)
    banla = month_fee - month_used
    print(banla)
    print(type(banla))
    while banla>0:
        banla = banla + (rw*day + rb)
        if (month==2):
            if ((year%4 == 0 and year%100 != 0) or year%400 == 0):
                if (day==29):
                    day=1
                    month=3
                else:
                    day = day + 1
            else:
                if (day==28):
                    day=1
                    month=3
                else:
                    day = day + 1
        elif (month==1 or month==3 or month==5 or month==7 or month==8 or month==10):
            if (day==31):
                day = 1
                month = month + 1
            else:
                day = day + 1
        elif (month==12):
            if (day==31):
                day = 1
                month = 1
                year = year + 1
            else:
                day = day + 1
        else:
            if (day==30):
                day = 1
                month = month + 1
            else:
                day = day + 1
        print(str(year) + " " + str(month) + " " + str(day))
        print("banlace: " + str(banla))
    
    
    ddl = str(year) + "-" + str(month) + "-" + str(day)
    sql_save_ddl = "update user_meta set ddl='" + ddl + "' where user_id='" + str(userid)  + "'"
    cursor.execute(sql_save_ddl)
    db.commit()

