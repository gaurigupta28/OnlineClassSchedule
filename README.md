# Online Class Schedule
Online Class Schedule
## Register page
 * This page allows new users to create an account by providing their details such as username, email, and password.
 * Upon submission, the entered information is validated to ensure it meets the required criteria (e.g., valid email format, unique username).
 * If registration is successful, the user's information is stored in the database, and they are redirected to the login page.
<img src="Images/Screenshot 2024-04-21 214523.png" > 

 ## Login page
  * Registered users can log in using their username/email and password.
  * The entered credentials are verified against the records stored in the database.
  * Upon successful authentication, users are granted access to their account and redirected to the subject page.
<img src="Images/Screenshot 2024-04-21 214537.png" > 

## Subject page
  * This page displays a list of available subjects or courses offered by the institution.
  * Users can browse through the list of subjects, view details such as subject name, description, and instructor.
  * They may have the option to filter subjects by category or search for specific subjects.
  * Each subject may have a button to view its class schedule or add it to the cart.
<img src="Images/Screenshot 2024-04-21 214614.png"> 

## Class Schedule
  * This page presents the schedule of classes for a selected subject.
  * Users can view details such as class date, time, instructor, and available seats.
  * They may have the option to filter classes by date, time, or instructor.
  * Users can select specific classes and add them to their cart for booking.
<img src="Images/Screenshot 2024-04-21 214634.png"> 

## Cart Page 
  * This page displays the classes selected by the user for booking.
  * Users can review the classes in their cart, including details such as class date, time, and instructor.
  * They may have the option to remove classes from the cart or proceed to checkout.
  * Before checkout, users may be prompted to confirm their selections and provide any additional information (e.g., payment details).
<img src="Images/Screenshot 2024-04-21 214659.png">

## Database Design

  * The application requires a database to store user information, subjects, class schedules, and cart items.
  * Tables such as Users, Subjects, Classes, and Cart are created to store relevant data.
  * Relationships between tables (e.g., one-to-many between Users and Cart) are established using foreign keys.
  * Stored procedures can be implemented for tasks such as user authentication, retrieving subject information, adding/removing items from the cart, etc.
## Dynamic Data:

  *  The application retrieves and displays data dynamically from the database based on user interactions and queries.
  * Server-side scripting languages such as C# (in ASP.NET) can be used to interact with the database and generate dynamic content.
  * User sessions are managed to maintain state across different pages and track user actions (e.g., login status, cart items).


