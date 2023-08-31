//prompt for code llama

String selectPrompt(String mainType, String subType, String content) {
  switch (mainType) {
    case "codeReview":
      return "Please review the following $subType code: \n\n$content";
    case "tc":
      return "Please generate a test case for the following $subType code: \n\n$content";
    case "sql":
      return "Please write a $subType SQL query for the following condition : \n\n$content";
    default:
      return "error";
  }
}
