const express = require('express');
const app = express();
app.use(express.json()); // це дозволить правильно обробляти JSON тіла запитів

const router = express.Router();
const Mac = require('../models/mac');

const mongoose = require('mongoose');
const db = "mongodb://localhost:27017/prod"
mongoose.Promise = global.Promise;

mongoose
    .connect(db)
    .then(() => {
    console.log("Connected to MongoDB");
    })
    .catch((err) => {
    console.error("Connection error: ", err);
    });


router.get('/macs', async (req, res) => {
    try {
        console.log('Get request for all');
        const macs = await Mac.find({}).exec();
        res.json(macs);
    } catch (err) {
        console.error("Error retrieving: ", err);
        res.status(500).send("Error retrieving");
    }
});

router.get('/macs/:id', async (req, res) => {
    const macId = req.params.id;
    try {
        console.log(`Get request for mac with ID: ${macId}`);
        const mac = await Mac.findById(macId).exec();
        if (mac) {
            res.json(mac);
        } else {
            res.status(404).send("mac not found");
        }
    } catch (err) {
        console.error("Error retrieving mac: ", err);
        res.status(500).send("Error retrieving mac");
    }
});

router.post('/macs', async (req, res) => {
    const newMac = new Mac({
        name: req.body.name,
        price: req.body.price,
        product_id: req.body.product_id,
    });
    try {
        console.log('Post a new mac');
        const insertedMac = await newMac.save();
        insertedMac.__v = String;
        res.json(insertedMac);
    } catch (err) {
        console.error("Error posting : ", err);
        res.status(500).send("Error posting");
    }
});

router.put('/macs/:id', async (req, res) => {
    console.log('Update a mac');
    const MacId = req.params.id;

    try {
        const updatemac = await Mac.findByIdAndUpdate(
            MacId,
            {
                $set: {
                    name: req.body.name,
                    type: req.body.price,
                    age: req.body.product_id,
                }
            },
            {
                new: true,
            }
        );

        if (!updatemac) {
            return res.status(404).json({ error: 'mac not found' });
        }

        res.json(updatemac);
    } catch (err) {
        console.error("Error updating mac:", err);
        res.status(500).json({ error: "Error updating mac" });
    }
});


router.delete('/macs/:id', async (req, res) => {
    console.log('Deleting a mac');
    const macId = req.params.id;

    try {
        const deletedmac = await Mac.findByIdAndDelete(macId);

        if (!deletedmac) {
            return res.status(404).json({ error: 'mac not found' });
        }

        res.status(200).json({ message: 'Mac deleted successfully', macc: deletedmac});
    } catch (err) {
        console.error("Error deleting:", err);
        res.status(500).json({ error: "Error deleting mac" });
    }
});

module.exports = router;