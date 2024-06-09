(princ (strcat "
					Author - Robert Stokłosa
					Available commands:
					TRIATVERTEX - inserts a triangle of the chosen size at each vertex of the polyline
") )

(defun C:TRIATVERTEX (triRad vertexLst poly)

    (setq   triRad (getstring "Determine the size of the triangles at the vertices: ") ;Provide the diameter of the circle on which the triangles will be inscribed
            poly (entget (car (entsel "\nSelect the polyline"))) ;Select the polyline and save its attributes in the variable 'poly'
    ) 

    (foreach pp poly
        (if (= (car pp) 10) ;Check if the attribute contains coordinates (starts with code 10).
        (setq vertexLst (cons (cdr pp) vertexLst)) ;Adding coordinates to the list vertexLst
        )
    ) ;A loop that creates a list of vertex coordinates

    (foreach pt vertexLst
        (command "_.POLYGON" "3" pt "_C" triRad)
    ) ;A loop for inserting triangles at all vertices

)