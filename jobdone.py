import smtplib
server = smtplib.SMTP('smtp.gmail.com', 587)
server.starttls()
server.login('user@gmail.com', 'passwd')
server.sendmail('user@gmail.com', 'num@msg.telus.com', 'Job done')
