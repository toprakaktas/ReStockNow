/**
 * Import function triggers from their respective submodules:
 *
 * const {onCall} = require("firebase-functions/v2/https");
 * const {onDocumentWritten} = require("firebase-functions/v2/firestore");
 *
 * See a full list of supported triggers at https://firebase.google.com/docs/functions
 */

const {onRequest} = require("firebase-functions/v2/https");
const logger = require("firebase-functions/logger");

const functions = require("firebase-functions");
const admin = require("firebase-admin");
const axios = require("axios");
const {onSchedule} = require("firebase-functions/v2/scheduler");

admin.initializeApp();

exports.checkStockAndNotify = onSchedule("every 1 hours", async (event) => {
  const itemsSnapshot = await admin.firestore().collection("items").get();
  const promises = itemsSnapshot.docs.map(async (doc) => {
    const item = doc.data();
    const response = await axios.get(item.url);
    const inStock = checkStockStatus(response.data); // Implement this function based on HTML structure
    if (inStock) {
      await admin.firestore().collection("items").doc(doc.id).update({ inStock: true });
      await sendNotification(item.url);
    }
  });
  await Promise.all(promises);
});

const checkStockStatus = (html) => {
  // Logic to parse HTML and determine stock status
  return html.includes("In Stock");
};

const sendNotification = async (itemUrl) => {
  const message = {
    notification: {
      title: "Item Back in Stock!",
      body: `The item at ${itemUrl} is back in stock.`,
    },
    topic: "stock-notifications",
  };
  await admin.messaging().send(message);
};


// Create and deploy your first functions
// https://firebase.google.com/docs/functions/get-started

// exports.helloWorld = onRequest((request, response) => {
//   logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });
