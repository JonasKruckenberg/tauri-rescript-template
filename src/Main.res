%%raw(`import './style.css'`)

let container = Webapi.Dom.Document.getElementById(Webapi.Dom.document, "root")

switch container {
| Some(container) => { 
    let root = ReactDOM.Client.createRoot(container)
    root -> ReactDOM.Client.Root.render(<App />)
}
| None => () // do nothing
}