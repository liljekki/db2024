const mongoose = require('mongoose');

const Schema = mongoose.Schema;

const macSchema = new Schema({
    name: String,
    price: String,
    product_id: String
}, { versionKey: false });

module.exports = mongoose.model('mac', macSchema, 'prod');