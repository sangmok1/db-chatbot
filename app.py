from flask import Flask, request, jsonify

app = Flask(__name__)

# 임시로 샘플 dictionary
COLUMN_DESCRIPTIONS = {
    "fct_store_purchase": {
        "item_type": "item_type is a column representing the type or category of item purchased in the store.",
        "item_id": "item_id is a unique identifier of the store item.",
        "total_user": "total_user is the number of unique users who purchased the item.",
    }
}

@app.route("/")
def index():
    return "✅ API 서버가 정상 작동 중입니다!"

@app.route("/describe", methods=["GET"])
def describe_column():
    table = request.args.get("table")
    column = request.args.get("column")

    if not table or not column:
        return jsonify({"error": "Missing table or column parameter"}), 400

    description = COLUMN_DESCRIPTIONS.get(table, {}).get(column)
    if not description:
        return jsonify({"error": "Description not found"}), 404

    return jsonify({
        "table": table,
        "column": column,
        "description": description
    })

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080)
