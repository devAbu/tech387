const express = require("express");
const mongoose = require("mongoose");
const authRouter = require("./routes/auth");

const app = express();
const PORT = 3000;

var cors = require("cors");

app.use(cors()); // Use this after the variable declaration

app.use(express.json());
const DB =
  "mongodb+srv://abu:aburefko159753@cluster0.nuc5xkg.mongodb.net/?retryWrites=true&w=majority";
mongoose
  .connect(DB)
  .then(() => {
    console.log("Connected");
  })
  .catch((err) => {
    console.log(err);
  });

/* app.get("/", (req, res) => {
  res.json({ name: "Abu" });
});
app.get("/hello", (req, res) => {
  res.json({ hi: "hello world" });
}); */

app.use(authRouter);

app.listen(PORT, "0.0.0.0", () => {
  console.log(`Connected at ${PORT} port`);
});
