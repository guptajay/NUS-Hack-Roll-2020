#!/usr/bin/env python

import csv
import time
import pandas as pd
import numpy as np
from tensorflow.keras.models import load_model
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart
from datetime import datetime
import smtplib

model = load_model('/Users/jay/Documents/Projects/NUS-Hack-Roll-2020/model.h5')


def email():
    timestamp = 1545730073
    dt_object = datetime.fromtimestamp(timestamp)
    gmail_user = 'botvigilant@gmail.com'
    gmail_password = 'jaygupta123456789'

    sent_from = gmail_user
    to = 'damanimehul24@gmail.com'

    msg = MIMEMultipart('alternative')
    msg['Subject'] = "Distress Call Alert!"
    msg['From'] = gmail_user
    msg['To'] = to

    html = """\
                <html>
                <head></head>
                <body>
                    <h2>Distress Alert</h2>
                    <p>Dear Mehul,<br />
                    This is a distress call from Jay Gupta who has listed you as an emergency contact. Please take suitable action for the same.<br /><br />
                    <strong>Details:</strong><br />
                    <strong>Time: </strong> """ + str(dt_object) + """ <br />
                    <strong>Place: </strong> Tembusu College, 26 College Avenue East, Singapore</p>
                    <br />
                    <hr />
                    <p>This was a auto-generated e-mail by VigilantBot.</p>
                </body>
                </html>
                """

    part1 = MIMEText(html, 'html')

    msg.attach(part1)

    try:
        server = smtplib.SMTP_SSL('smtp.gmail.com', 465)
        server.ehlo()
        server.login(gmail_user, gmail_password)
        server.sendmail(sent_from, to, msg.as_string())
        server.close()
        print()
        print("==================")
        print("Distress E-Mail Sent!")
        print("==================")
        print()
    except Exception as e:
        print(e)


def predict(i):
    df = pd.read_csv(
        "/Users/jay/Documents/Projects/NUS-Hack-Roll-2020/test.csv")
    flatten_data = np.array(df.values.flatten())
    flatten_data = np.array(flatten_data[i:i+480])
    return flatten_data


def panda():
    i = 0
    count = 1
    snap_count = 0
    distress_email = 0
    j = 0
    while(1):
        try:
            input_data = []
            input_data.append(predict(i))
            input_data = np.array(input_data)
            result = model.predict(input_data)
            ans = result[0]
            ans_f = ans[0]
            # print(ans_f)

            if(distress_email == 1):
                j += j

            if(snap_count == 4 and snap_count != 0):
                if(distress == 1 and j < 5):
                    continue
                else:
                    email()
                    snap_count = 0
                    distress_email = 1
                    j = 0

            if(ans_f > 0.5):
                print("==================")
                print("Gesture Initiated!")
                print("==================")
                snap_count = snap_count+1
            else:
                print("--")
            i = i + 60
            count = count + 1
            # print(count)
            time.sleep(0.9)
        except Exception as e:
            time.sleep(2)
            continue


panda()
