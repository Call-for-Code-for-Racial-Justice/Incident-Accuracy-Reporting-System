import { createContext } from "react";

const mediaContext = createContext({
  attachments: [],
  updateAttachments: (item1, item2) => {},
  isCameraEnabled: false,
  setIsCameraEnabled: (item) => {}
});

export default mediaContext;