type disposable
type extensionContext = {
  subscriptions: array<disposable>,
}

@module("vscode") @scope("window")
external showInformationMessage: string => unit = "showInformationMessage"

@module("vscode") @scope("commands")
external registerCommand: (string, unit => unit) => disposable = "registerCommand"

let names = ["Anna", "Peter", "Wolf", "Suzanne", "Joshua", "Max", "Paul", "Moby"]

let activate = (context: extensionContext) => {

  Js.log("Congratulations, your extension 'helloworld-sample' is now active!!!!!!")

  let randomName = Math.floor(Math.random() *. names->Array.length->Int.toFloat)->Float.toInt

  let disposable = registerCommand("extension.helloWorld", () =>
    showInformationMessage(`Your random person name of the day is: ${names->Array.getUnsafe(randomName)}`)
  )

  context.subscriptions->Array.push(disposable)
}
