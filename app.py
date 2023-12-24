from flask import Flask, jsonify, request
import mysql.connector
from flask_cors import CORS 

app = Flask(__name__)
CORS(app)

# Configure your MySQL connection
mydb = mysql.connector.connect(
  host="localhost",       # or your host, if it's not localhost
  user="root",    # your MySQL username
  password="cdfs34.,",# your MySQL password
  database="TransportationDB" # your database name
)

@app.route('/')
def home():
    return "Welcome to the Transportation API!"

# Fetch all customers
@app.route('/customers', methods=['GET'])
def get_customers():
    cursor = mydb.cursor(dictionary=True)
    cursor.execute("SELECT * FROM Customer")
    result = cursor.fetchall()
    cursor.close()
    return jsonify(result)

# Add a new customer
@app.route('/customer', methods=['POST'])
def add_customer():
    details = request.json
    cursor = mydb.cursor()
    sql = "INSERT INTO Customer (Name, Street, City, State, Zipcode, Phone, Email) VALUES (%s, %s, %s, %s, %s, %s, %s)"
    val = (details['Name'], details['Street'], details['City'], details['State'], details['Zipcode'], details['Phone'], details['Email'])
    cursor.execute(sql, val)
    mydb.commit()
    cursor.close()
    return jsonify({'message': 'Customer added successfully!'})

# Run the app
if __name__ == '__main__':
    app.run(debug=True, port=5002)


