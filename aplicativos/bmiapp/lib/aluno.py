class Aluno():

    def __init__(self, nome, nota1, nota2):
        self.nome = nome
        self.nota1 = nota1
        self.nota2 = nota2

    def media(self):
        return (self.nota1 + self.nota2) / 2.0


aluno1 = Aluno(nota2=6.7, nota1=10, nome='Rogerio',)
print(aluno1.media())


class Scaffold():

    def __init__(self, appBar, body, floatingActionButton, drawer):
        pass


Scaffold('appbar', 'sadasd', 'dfgdfgdf', 'adasdas')


class Padding():

    def __init__(self, padding):
        pass
