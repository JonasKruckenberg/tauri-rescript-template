// This file contains binding declarations for @tauri-apps/api
// This file is very bare-bones for the purposes of this template, but you can add bindings here as needed.
// See https://rescript-lang.org/docs/manual/latest/bind-to-js-function for details

@module("@tauri-apps/api/tauri") external invoke: (~cmd: string, ~payload: 'a=?) => Promise.t<'b> = "invoke"
