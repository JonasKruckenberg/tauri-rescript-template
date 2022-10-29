@module("./assets/react.svg") external reactLogo: string = "default"
%%raw(`import './App.css'`)

open Promise

@react.component
let make = () => {
  let (greetMsg, setGreetMsg) = React.useState(() => "")
  let (name, setName) = React.useState(() => "")

  let greet = () => {
    Tauri.invoke(~cmd="greet", ~payload={"name": name})
    ->then(msg => {
      setGreetMsg(msg)
      resolve()
    })
    ->ignore
  }

  <div className="container">
    <h1> {"Welcome to Tauri!"->React.string} </h1>
    <div className="row">
      <a href="https://vitejs.dev" target="_blank">
        <img src="/vite.svg" className="logo vite" alt="Vite logo" />
      </a>
      <a href="https://tauri.app" target="_blank">
        <img src="/tauri.svg" className="logo tauri" alt="Tauri logo" />
      </a>
      <a href="https://rescript-lang.org" target="_blank">
        <img src="/rescript.png" className="logo rescript" alt="ReScript logo" />
      </a>
      <a href="https://reactjs.org" target="_blank">
        <img src={reactLogo} className="logo react" alt="React logo" />
      </a>
    </div>
    
    <p> {"Click on the Tauri, Vite, ReScript, and React logos to learn more."->React.string} </p>
  
    <p>
        {"Recommended IDE setup: "->React.string}
        <a href="https://code.visualstudio.com/" target="_blank">{"VS Code"->React.string}</a>
        {" + "->React.string}
        <a href="https://github.com/tauri-apps/tauri-vscode" target="_blank">{"Tauri"->React.string}</a>
        {" + "->React.string}
        <a href="https://github.com/rust-lang/rust-analyzer" target="_blank">{"rust-analyzer"->React.string}</a>
        {" + "->React.string}
        <a href="https://github.com/rescript-lang/rescript-vscode" target="_blank">{"ReScript"->React.string}</a>
    </p>
  
    <div className="row">
      <div>
        <input
          id="greet-input"
          onChange={evt => {
            ReactEvent.Form.preventDefault(evt)
            let value = ReactEvent.Form.target(evt)["value"]
            setName(_prev => value)
          }}
          placeholder="Enter a name..."
        />
        <button onClick={_evt => greet()}> {"Greet"->React.string} </button>
      </div>
    </div>
    <p> {greetMsg->React.string} </p>
  </div>
}
