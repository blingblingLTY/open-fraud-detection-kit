# app.py
from flask import Flask, request, jsonify
from main import main

app = Flask(__name__)

@app.route('/predict', methods=['GET'])
def get_prediction():
    try:
        # get result for predefined function
        result = main()

        # Return the result as JSON
        return jsonify(result)

    except Exception as e:
        # Handle exceptions
        return jsonify({'error': str(e)}), 500

if __name__ == '__main__':
    app.run(debug=True)
