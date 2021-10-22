import React from "react";
import { render } from "react-dom";
import Routes from "../routes/index";

document.addEventListener("DOMContentLoaded", () => {
  render(<Routes />, document.getElementById("root"));
});
