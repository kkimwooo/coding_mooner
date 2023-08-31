//prompt for code llama

String selectPrompt(String mainType, String subType, String content) {
  switch (mainType) {
    case "codeReview":
      return "I'm developer, Please review the following $subType code for code smells and suggest improvements: $content"; //Spring
    case "tc":
      return "Please generate a test case for the following $subType code: \n\n$content"; //Spring
    case "TDD":
      return "I'm trying to write the implementation code in the TDD.Please fill out the [Junit] test code below as [spring boot] implementation code : \n\n$content";
    case "sql":
      return "Please write a $subType SQL query for the following condition : \n\n$content";
    case "explain":
      return "Explain the following $subType snippet of code: \n\n $content";
    case "etc":
      return content;
    default:
      return "error";
  }
}
