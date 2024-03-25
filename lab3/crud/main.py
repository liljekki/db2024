from flask import Flask, request, jsonify, render_template
import psycopg2

app = Flask(__name__)

conn = psycopg2.connect(
    dbname="mcdonalds",
    user="manager",
    password="manager",
    host="localhost",
    port="5432"
)
cur = conn.cursor()

@app.route('/')
def index():
    cur.execute("SELECT * FROM \"Order\"")  
    orders = cur.fetchall()
    return render_template('index.html', orders=orders)

@app.route('/orders', methods=['POST'])
def create_order():
    data = request.get_json()
    customer_id = data['customer_id']
    date = data['date']
    total_amount = data['total_amount']
    cur.execute("INSERT INTO \"Order\" (customer_id, date, total_amount) VALUES (%s, %s, %s) RETURNING order_id", (customer_id, date, total_amount))
    order_id = cur.fetchone()[0]
    conn.commit()
    return jsonify({'order_id': order_id}), 201

@app.route('/orders', methods=['GET'])
def get_orders():
    cur.execute("SELECT * FROM \"Order\"")
    orders = cur.fetchall()
    orders_list = [{'order_id': order[0], 'customer_id': order[1], 'date': order[2].isoformat(), 'total_amount': float(order[3])} for order in orders]
    return jsonify(orders_list), 200

@app.route('/orders/<int:order_id>', methods=['GET'])
def get_order(order_id):
    cur.execute("SELECT * FROM \"Order\" WHERE order_id = %s", (order_id,))
    order = cur.fetchone()
    if order:
        order_dict = {'order_id': order[0], 'customer_id': order[1], 'date': order[2].isoformat(), 'total_amount': float(order[3])}
        return jsonify(order_dict), 200
    else:
        return jsonify({'message': 'Order not found'}), 404

@app.route('/orders/<int:order_id>', methods=['PUT'])
def update_order(order_id):
    data = request.get_json()
    customer_id = data['customer_id']
    date = data['date']
    total_amount = data['total_amount']
    cur.execute("UPDATE \"Order\" SET customer_id = %s, date = %s, total_amount = %s WHERE order_id = %s", (customer_id, date, total_amount, order_id))
    conn.commit()
    return jsonify({'message': 'Order updated successfully'}), 200

@app.route('/orders/<int:order_id>', methods=['DELETE'])
def delete_order(order_id):
    cur.execute("DELETE FROM \"Order\" WHERE order_id = %s", (order_id,))
    conn.commit()
    return jsonify({'message': 'Order deleted successfully'}), 200


@app.route('/calculate_order', methods=['GET'])
def calculate_order_route():
    customer_id = request.args.get('customer_id')
    cur.execute("SELECT calculate_order(%s)", (customer_id,))
    result = cur.fetchone()[0]
    return jsonify({'result': result}), 200

if __name__ == '__main__':
    app.run(debug=True)
