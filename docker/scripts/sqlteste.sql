CREATE TABLE testeScriptSQL (
    idScript int primary key auto_increment,
    nomeScript varchar(150)
);
CREATE TABLE testeScriptSQL_DOIS (
    idScript_dois int primary key auto_increment,
    nomeScript_dois varchar(150),
    fk_script int,
    FOREIGN KEY (fk_script) REFERENCES testeScriptSQL (idScript)
);
CREATE TABLE testeScriptSQL_TRES (
    idScript_tres int primary key auto_increment,
    nomeScript_tres varchar(150),
    fk_script_dois int,
    FOREIGN KEY (fk_script_dois) REFERENCES testeScriptSQL_DOIS (idScript_dois)
);