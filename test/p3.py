import tensorflow as tf
import numpy as np
import matplotlib.pyplot as plt
import pymysql

db_config = {"host" : "127.0.0.1", "port" : 3306, "user" : "root", "password" : "Qw123456_", "db" : "bill"}
db = pymysql.connect(host = db_config['host'], port = db_config['port'], user = db_config['user'], password = db_config['password'], db = db_config['db'], charset = 'utf8mb4')
cursor = db.cursor()

sql_get_users = "select id from user";
cursor.execute(sql_get_users)
users = cursor.fetchall();

from hashlib import sha1
import requests
for i in range(0, len(users)):
    userid = users[i][0];
    print("Userid = " + str(userid))
    sql_get_bills = "select token,id from user_online where user_id='" + str(userid) + "' order by update_time desc"
    cursor.execute(sql_get_bills)
    user_online = cursor.fetchone()
    if user_online is not None:
        token = user_online[0]
        sessionid = user_online[1]
        print("     origin token = " + token)
        print("     sessionid = " + str(sessionid))
        s1 = sha1()
        s1.update(token.encode())
        token = s1.hexdigest()
        print("     sha1(token) = " + token)

        r = requests.get('http://127.0.0.1/bills', data = {'sessionid' :
                                                          sessionid, 'token' :
                                                          token
                                                          })
        print(r.text)

rng = np.random

# Parameters
learning_rate = 0.01
training_epochs = 5000
display_step = 50

r_X = [3.3, 4.4, 5.5, 6.71, 6.93, 4.168, 9.779, 6.182, 7.59, 2.167,
                      7.042, 10.791, 5.313, 7.997, 5.654, 9.27, 3.1]
r_Y = [1.7, 2.76, 2.09, 3.19, 1.694, 1.573, 3.366, 2.596, 2.53, 1.221,
                      2.827, 3.465, 1.65, 2.904, 2.42, 2.94, 1.3]

def getRT():
    pass

getRT()

# Training Data
train_X = np.asarray(r_X)
train_Y = np.asarray(r_Y)
n_samples = train_X.shape[0]

# tf Graph Input
X = tf.placeholder(tf.float32)
Y = tf.placeholder(tf.float32)

# Set model weights
W = tf.Variable(rng.randn(), name="weight")
b = tf.Variable(rng.randn(), name="bias")

# Construct a linear model
pred = tf.add(tf.multiply(X, W), b)

# Mean squared error
cost = tf.reduce_sum(tf.pow(pred-Y, 2))/(2*n_samples)
# Gradient descent
#  Note, minimize() knows to modify W and b because Variable objects are trainable=True by default
optimizer = tf.train.GradientDescentOptimizer(learning_rate).minimize(cost)

# Initialize the variables (i.e. assign their default value)
init = tf.global_variables_initializer()

# 开始训练

with tf.Session() as sess:

    # 执行初始化操作
    sess.run(init)

    # 拟合模型数据
    for epoch in range(training_epochs):
        for (x, y) in zip(train_X, train_Y):
            sess.run(optimizer, feed_dict={X: x, Y: y})

        # 每50次迭代后在控制台输出模型当前训练的loss以及权重大小
        if (epoch+1) % display_step == 0:
            c = sess.run(cost, feed_dict={X: train_X, Y:train_Y})
            print("Epoch:", '%04d' % (epoch+1), "cost=", "{:.9f}".format(c), \
                "W=", sess.run(W), "b=", sess.run(b))

    print("Optimization Finished!")
    training_cost = sess.run(cost, feed_dict={X: train_X, Y: train_Y})
    print("Training cost=", training_cost, "W=", sess.run(W), "b=", sess.run(b), '\n')

    # 画出拟合图像
    plt.plot(train_X, train_Y, 'ro', label='Original data')
    plt.plot(train_X, sess.run(W) * train_X + sess.run(b), label='Fitted line')
    plt.legend()
    plt.show()
    
    rw = sess.run(W)
    rb = sess.run(b)
    print("Final w=" + str(rw))
    print("final b=" + str(rb))

