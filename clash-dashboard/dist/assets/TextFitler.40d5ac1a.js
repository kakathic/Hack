import{g as i,r as a,O as l,N as u,j as p}from"./vendor.bd9188bf.js";import{d as x}from"./debounce.76599460.js";const _="_rotate_1dspl_1",d="_isRotating_1dspl_5",g="_rotating_1dspl_1";var r={rotate:_,isRotating:d,rotating:g};function E({isRotating:t}){const e=i(r.rotate,{[r.isRotating]:t});return a.exports.createElement("span",{className:e},a.exports.createElement(l,{width:16}))}const{useCallback:m,useState:R,useMemo:b}=p;function f(t){const[,e]=u(t),[n,c]=R(""),o=b(()=>x(e,300),[e]);return[m(s=>{c(s.target.value),o(s.target.value)},[o]),n]}const h="_input_16a1f_1";var v={input:h};function N(t){const[e,n]=f(t.textAtom);return a.exports.createElement("input",{className:v.input,type:"text",value:n,onChange:e,placeholder:t.placeholder})}export{E as R,N as T};