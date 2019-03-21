import tensorflow as tf
import numpy as np
import matplotlib.pyplot as plt
import pymysql


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
    sql_get_usermeta = "select month_fee from user_meta where user_id='" + str(userid) + "'"
    cursor.execute(sql_get_usermeta)
    month_fee = cursor.fetchone()
    if month_fee is None:
        continue
    month_fee = month_fee[0]
    print("     month_fee=" + str(month_fee))

    sql_get_bills = "select year,month,day,io,sum from bill where user_id='" + str(userid) + "'"
    cursor.execute(sql_get_bills)
    bills = cursor.fetchall()
    print("     bills=" + str(bills))

    r_X = [3.3, 4.4, 5.5, 6.71, 6.93, 4.168, 9.779, 6.182, 7.59, 2.167,
                      7.042, 10.791, 5.313, 7.997, 5.654, 9.27, 3.1]
    r_Y = [1.7, 2.76, 2.09, 3.19, 1.694, 1.573, 3.366, 2.596, 2.53, 1.221,
                      2.827, 3.465, 1.65, 2.904, 2.42, 2.94, 1.3]

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
        r_X.append(day)
        r_Y.append(alldays[key]['sum'])
    # Training Data
    print(alldays)
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
        '''
        plt.plot(train_X, train_Y, 'ro', label='Original data')
        plt.plot(train_X, sess.run(W) * train_X + sess.run(b), label='Fitted line')
        plt.legend()
        plt.show()
        '''
        rw = sess.run(W)
        rb = sess.run(b)
        print("     Final w=" + str(rw))
        print("     Final b=" + str(rb))




