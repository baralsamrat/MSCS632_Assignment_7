(* Calculate mean, median, and mode in a functional style using OCaml *)

(* Compute the mean (average) of a list of integers.
   Returns 0.0 for an empty list. *)
let mean lst =
  match lst with
  | [] -> 0.0
  | _  ->
      (* Use List.fold_left to sum all elements, then divide by the list length *)
      let sum = List.fold_left ( + ) 0 lst in
      float_of_int sum /. float_of_int (List.length lst)

(* Compute the median of a list of integers.
   Returns 0.0 for an empty list.
   For an odd-length list, the median is the middle element.
   For an even-length list, the median is the average of the two middle elements. *)
let median lst =
  match lst with
  | [] -> 0.0
  | _  ->
      let sorted = List.sort compare lst in
      let n = List.length sorted in
      if n mod 2 = 1 then
        (* Odd number of elements: take the middle one *)
        float_of_int (List.nth sorted (n / 2))
      else
        (* Even number of elements: average the two middle values *)
        let mid1 = List.nth sorted ((n / 2) - 1) in
        let mid2 = List.nth sorted (n / 2) in
        (float_of_int (mid1 + mid2)) /. 2.0

(* Compute the mode of a list of integers (most frequent value).
   Returns 0 for an empty list.
   If multiple values are tied for mode, one of them is returned. *)
let mode lst =
  let sorted = List.sort compare lst in  (* Sort to group identical values *)
  match sorted with
  | [] -> 0
  | hd :: tl ->
      (* Use a fold to track the current run of identical numbers and the best run (mode) so far.
         The accumulator is (mode_val, mode_count, current_val, current_count). *)
      let update_mode (mode_val, mode_count, current_val, current_count) x =
        if x = current_val then
          (* Still in the same run of a number *)
          (mode_val, mode_count, current_val, current_count + 1)
        else
          (* Number changed: check if the previous run was the longest (update mode if needed) *)
          let (new_mode_val, new_mode_count) =
            if current_count > mode_count then (current_val, current_count)
            else (mode_val, mode_count)
          in
          (* Start a new run for the new number x *)
          (new_mode_val, new_mode_count, x, 1)
      in
      (* Initialize with the first element as the current run and mode candidate *)
      let (mode_val, mode_count, curr_val, curr_count) =
        List.fold_left update_mode (hd, 1, hd, 1) tl
      in
      (* After folding through the list, compare the last run with the best mode found *)
      let final_mode =
        if curr_count > mode_count then curr_val else mode_val
      in
      final_mode

(* Example usage: *)
let () =
  let data = [5; 3; 8; 3; 9; 1] in
  Printf.printf "Data: ";
  List.iter (Printf.printf "%d ") data;
  Printf.printf "\\n";
  Printf.printf "Mean: %.2f\\n" (mean data);
  Printf.printf "Median: %.2f\\n" (median data);
  Printf.printf "Mode: %d\\n" (mode data)
