import React, { createContext, useState } from "react";

const mediaContext = createContext({
  mediaDetails: {},
  updateAttachments: (op, item) => {},
  setIsCameraEnabled: (item) => {},
  resetMediaDetails: () => {},
});

export const MediaContextProvider = (props) => {
  const [mediaDetails, setMediaDetails] = useState({
    attachments: [],
    isCameraEnabled: false
  });

  const updateAttachmentsHandler = (op, item) => {
    if( op==='ADD' ) {
      setMediaDetails(
        (prevState) => ({
          ...prevState,
          attachments: [...mediaDetails.attachments, item]
        })
      );
    } else if ( op==='REMOVE' ) {
      setMediaDetails(
        (prevState) => ({
          ...prevState,
          attachments: mediaDetails.attachments.filter( x => x.uri !== item.uri )
        })
      );
    }
  };

  const setIsCameraEnabledHandler = (newValue) => {
    setMediaDetails(
      (prevState) => ({
        ...prevState,
        isCameraEnabled: newValue
      })
    );
  }

  const resetMediaDetailsHandler = () => {
    setMediaDetails({
      attachments: [],
      isCameraEnabled: false
    });
  }

  return (
    <mediaContext.Provider
      value={{
        mediaDetails: mediaDetails,
        updateAttachments: updateAttachmentsHandler,
        setIsCameraEnabled: setIsCameraEnabledHandler,
        resetMediaDetails: resetMediaDetailsHandler
      }}
    >
      {props.children}
    </mediaContext.Provider>
  );
}

export default mediaContext;