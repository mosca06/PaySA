# Payment Simulation Application

## Overview

This is a simple Ruby on Rails application that simulates online payment processing. It is designed for demonstration purposes to showcase basic payment functionalities. The application allows users to create payment transactions, simulate payment processing, and view transaction details.

## Features

- **Create Transactions:** Users can enter transaction details including amount and currency.
- **Simulate Payment Processing:** After creating a transaction, the application simulates the payment process, updating the transaction with a fake transaction number and status.
- **View Transaction Details:** Users can view detailed information about each transaction, including the simulated payment status.

## Technologies

- **Ruby on Rails:** Framework used for building the application.
- **PostgreSQL:** Database used for storing transaction data.
- **Faker:** Gem used to generate fake transaction data for simulation.

## Setup

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/yourusername/payment_simulation_app.git
   cd payment_simulation_app
Install Dependencies:

bash
Copy code
bundle install
Setup the Database:

bash
Copy code
rails db:create
rails db:migrate
Start the Rails Server:

bash
Copy code
rails server
Access the Application:
Open your browser and go to http://localhost:3000/transactions/new to create a new transaction and simulate payment processing.

Usage
Create a New Transaction: Fill out the form with the transaction amount and currency, then submit to create a transaction.
View Transaction Details: After submission, you'll be redirected to a page displaying the details of the transaction, including the simulated payment status and transaction number.
Contribution
Feel free to fork the repository and make improvements or adjustments. If you have any questions or issues, please open an issue on GitHub.

