import React, { useEffect, useState } from "react";
const axios = require("axios");
export default function Input({ clickProps, sender, receiver }) {
  const [answerInput, setAnswerInput] = useState("");
  const [predictiveText, setPredictiveText] = useState("");

  useEffect(() => {
    async function getPredictedText(input) {
      await axios({
        method: "post",
        url: "http://localhost:5000/main",
        data: {
          smartm: input,
        },
      })
        .then((res) => {
          setPredictiveText(res.data);
        })
        .catch((error) => {
          console.log(error);
        });
    }
    getPredictedText(answerInput);
  }, [answerInput]);

  return (
    <>
      <div>
        <span>text suggestion: {predictiveText}</span>
      </div>
      <div className="Chat_compose">
        <input
          className="Chat_compose_input"
          type="text"
          placeholder="Type a message..."
          value={answerInput}
          onChange={async (e) => {
            setAnswerInput(e.target.value);
          }}
        />
        <button
          className="Chat_compose_button button"
          onClick={(e) => {
            clickProps({
              variables: {
                text: answerInput,
                sender,
                receiver,
              },
            });
          }}
        >
          submit
        </button>
      </div>
    </>
  );
}
