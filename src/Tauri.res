@module("@tauri-apps/api/tauri") external invoke: (~cmd: string, ~payload: 'a=?) => Promise.t<'b> = "invoke"
