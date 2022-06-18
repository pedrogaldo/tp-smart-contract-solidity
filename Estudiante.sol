// SPDX-License-Identifier: MIT
pragma solidity^ 0.8.10;
 
contract estudiante{
    //declaracion de variables pedidas en la consigna
    string private _nombre;
    string private _apellido;
    string private _curso;

    //array que contiene la cantidad de materias
    string [] private arrayCantidadDeMaterias;


    address private _docente;
    mapping (string => uint8) private notas_materia;

    
    //asigna las variables en su lugar correspondiente del contrato
       constructor(string memory nombre_, string memory apellido_, string memory curso_)
    {
        _nombre = nombre_;
        _apellido = apellido_;
        _curso = curso_;
        _docente = msg.sender;
    }
    //devuelve el apellido
    function apellido (string memory) public view returns (string memory)
    {
        return _apellido;
    }

   //devuelve el nombre completo concatenando el nombre y el apellido
    function nombre_completo () public view returns (string memory)
    {
        return string(abi.encodePacked(_nombre,' ',_apellido));
    }
 
    //devuelve el curso
    function curso () public view returns (string memory)
    {
        return _curso;
    }

    //devuelve la nota de una materia
    function nota_materia(string memory materia) public view returns (uint8)
    {
        return notas_materia[materia];
    }
 
    //sube a un array las notas
    function set_nota_materia(uint8 nota, string memory materia) public
    {
       require (msg.sender == _docente, "Acceso solo para docentes");
       notas_materia[materia] = nota;
       arrayCantidadDeMaterias.push(materia);
    }
 
    // muestra true si el estudiante aprobó y false si desaprobó
    function aprobo(string memory materia) public view returns(bool)
    {
       if (notas_materia [materia] >= 60)
        {
           return true;
        }
       else
        {
            return false;
        }
    }
    // calcula el promedio del estudiante
    function promedio() public view returns(uint)
    {
        
        uint _cantidadMaterias = arrayCantidadDeMaterias.length;
        uint _promedio = 0;

        for (uint8 i = 0; i < _cantidadMaterias; i++)
        {
            _promedio += notas_materia[arrayCantidadDeMaterias[i]]; 
        }

      
        return _promedio /= _cantidadMaterias;
    }
 
   
}
