Printexc.record_backtrace true

let file = open_in "j2.txt"

let rec read f tot =
  try
    let line = input_line f in
    if line.[0] = 'A' then (*rock*)
      match line.[2] with
        a when a = 'X' ->  read f (tot+ 3 ) (*lose*)
      | a when a =  'Y' -> read f (tot+3+ 1 ) (* draw *)
      | a when a = 'Z' -> read f (tot+6+2) (* win *)
      | _ -> ()
    else if line.[0] = 'B' then
      match line.[2] with (*paper*)
        a when a = 'X' -> read f (tot+1 )
      | a when a =  'Y' -> read f (tot+3+2 )
      | a when a = 'Z' -> read f (tot+6+3)
      | _ -> ()
    else
    match line.[2] with
        a when a = 'X' -> read f (tot+2 )
      | a when a =  'Y' -> read f (tot+3+3 )
      | a when a = 'Z' -> read f (tot+6+1 )
      | _ -> ()
  with End_of_file -> Printf.printf "%i" tot

let _ = read file 0


(* -301 *)
(* 10766 *)
(*16704*)

(* p2 *)
(*16252*)

(* 16093 *)
