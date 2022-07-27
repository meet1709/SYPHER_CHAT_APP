# E-Case-Management

A database driven web application developed using PHP and MySQL which is a one solution to manage all the hospital related activities from admin side which includes Doctor’s
job request, patient registration, Booking Appointment along with email notification and payment option.

---

## Screenshots
![Image of adduser](https://github.com/Chirag-S-7/E-Case-Management/blob/main/Screenshot/Admin_Dashboard.jpeg)
![Image of adduser](https://github.com/Chirag-S-7/E-Case-Management/blob/main/Screenshot/Doctor_Dashboard.jpeg)
![Image of adduser](https://github.com/Chirag-S-7/E-Case-Management/blob/main/Screenshot/Patient_Dashboard.jpeg)
![Image of adduser](https://github.com/Chirag-S-7/E-Case-Management/blob/main/Screenshot/schedule_slot.jpeg)
![Image of adduser](https://github.com/Chirag-S-7/E-Case-Management/blob/main/Screenshot/Booking_Appointment.jpeg)
![Image of adduser](https://github.com/Chirag-S-7/E-Case-Management/blob/main/Screenshot/Invoice.jpeg)



## Functions
### Admin
- Signup their account. Then Login (No approval Required).
- Can register/view/approve/reject/delete doctor (approve those doctor who applied for job in their hospital).
- Can admit/view/approve/reject/discharge patient (discharge patient when treatment is done).
- Can Generate/Download Invoice pdf (Generate Invoice according to medicine cost, room charge, doctor charge and other charge).
- Can view/book/approve Appointment (approve those appointments which is requested by patient).

### Doctor
- Apply for job in hospital. Then Login (Approval required by hospital admin, Then only doctor can login).
- Can only view their patient details (symptoms, name, mobile ) assigned to that doctor by admin.
- Can view their discharged(by admin) patient list.
- Can view their Appointments, booked by admin.
- Can delete their Appointment, when doctor attended their appointment.

### Patient
- Create account for admit in hospital. Then Login (Approval required by hospital admin, Then only patient can login).
- Can view assigned doctor's details like ( specialization, mobile, address).
- Can view their booked appointment status (pending/confirmed by admin).
- Can book appointments.(approval required by admin)
- Can view/download Invoice pdf (Only when that patient is discharged by admin).

---

## How to run this project

1. Install XAMPP or WAMPP.

2. Open XAMPP Control panal and start [apache] and [mysql] .

3. Download project from github(https://github.com/Chirag-S-7/E-Case-Management).
 
 OR follow gitbash commands

    i>cd C:\\xampp\htdocs\

    ii>git clone https://github.com/Chirag-S-7/E-Case-Management.git

4. extract files in C:\\xampp\htdocs\.

5. open link localhost/phpmyadmin

6. click on new at side navbar.

7. give a database name as (hms) hit on create button.

8. after creating database name click on import.

9. browse the file in directory [hms.sql].

10. open any browser and type http://localhost/SRI2/index.php.

11.first register and then login

12. admin login details Username=admin and Password=1234

## Changes Required for Email 
- In C:\xampp\php\php.ini You have to give your email and change port
```
[mail function]
SMTP=smtp.gmail.com
smtp_port=587
sendmail_from =your-email-id
sendmail_path ="\"C:\xampp\sendmail\sendmail.exe\" -t"

```

- In C:\xampp\sendmail\sendmail.ini You have to give your password 
```
[sendmail]
smtp_server=smtp.gmail.com
smtp_port=587
auth_username=your-email-id
auth_password=password
force_sender=email-id
```


