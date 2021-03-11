import React, { useState } from "react";

export default function Input({ clickProps, sender, receiver }) {
  const [answerInput, setAnswerInput] = useState("");
  const [predictiveText, setPredictiveText] = useState("");


  async function getPredictedText(input){
    // axios api call here
    // set state here
  }

  return (
    <>
      <div></div>
      <div className="Chat_compose">
        <input
          className="Chat_compose_input"
          type="text"
          placeholder="Type a message..."
          value={answerInput}
          onChange={(e) => {
            getPredictedText(e)
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
