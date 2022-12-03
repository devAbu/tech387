const express = require("express");
const User = require("../models/user");
const bcryptjs = require("bcryptjs");
const e = require("express");
const jwt = require("jsonwebtoken");

const authRouter = express.Router();

authRouter.get("/user", (req, res) => {
  res.json({ msg: "Abu" });
});

authRouter.post("/api/signup", async (req, res) => {
  //get the data from client
  console.log(req.body);
  try {
    const { name, email, password } = req.body;

    const existingUser = await User.findOne({
      email,
    });

    if (existingUser) {
      return res
        .status(400)
        .json({ msg: "User with the same email already exists!!" });
    }

    const hashedPass = await bcryptjs.hash(password, 8);

    //post the data in db
    let user = new User({
      email,
      password: hashedPass,
      name,
    });

    user = await user.save();

    //return that data to the user or message
    res.json(user);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

authRouter.post("/api/signin", async (req, res) => {
  console.log("juhu");
  try {
    const { email, password } = req.body;

    const user = await User.findOne({ email });
    if (!user) {
      return res
        .status(400)
        .json({ msg: "User with this email does not exists" });
    }

    const isMatch = await bcryptjs.compare(password, user.password);
    if (!isMatch) {
      return res.status(400).json({ msg: "Password is not correct" });
    }

    const token = jwt.sign({ id: user._id }, "passwordKey");
    res.json({ token, ...user._doc });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

module.exports = authRouter;
