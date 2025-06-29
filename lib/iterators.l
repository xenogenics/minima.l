(def foldl (fun acc lst)
	"Left-fold FUN over LST with ACC as the default accumulator value."
	(if (lst? lst)
		(if (nil? lst)
			acc
			(foldl fun (fun acc (car lst)) (cdr lst)))
		(fun acc lst)))

(def foldr (fun lst acc)
	"Right-fold FUN over LST with ACC as the default accumulator value."
	(if (lst? lst)
		(if (nil? lst)
			acc
			(fun (car lst) (foldr fun (cdr lst) acc)))
		(fun lst acc)))

(def iter (fun lst)
	"Iterator of LST by calling FUN on every element."
	(if (not (nil? lst))
		(prog
			(fun (car lst))
			(iter fun (cdr lst)))))

(def map (fun lst)
	"Sequentially apply FUN to all elements of LST."
	(if (and (not (nil? lst)) (lst? lst))
		(cons
			(fun (car lst))
			(map fun (cdr lst)))
		lst))

(def map2 (fun lst1 lst2)
	"Apply FUN to all elements of both LST1 and LST2."
	(if (and (and (not (nil? lst1)) (lst? lst1)) (and (not (nil? lst2)) (lst? lst2)))
		(cons
			(fun (car lst1) (car lst2))
			(map2 fun (cdr lst1) (cdr lst2)))))

(def zip (lst1 lst2)
	"Sequentially pair-up elements from LST1 and LST2."
	(map2 cons lst1 lst2))
