CREATE DATABASE biblioteca_geovanna;

USE biblioteca_geovanna;

CREATE TABLE livro(
id_livro INT AUTO_INCREMENT PRIMARY KEY,
titulo TEXT NOT NULL,
isbn INT NOT NULL,
descricao TEXT NOT NULL
);

CREATE TABLE autor(
id_autor INT AUTO_INCREMENT PRIMARY KEY,
nome TEXT NOT NULL,
data_nascimento DATE NOT NULL,
biografia TEXT NOT NULL
);

CREATE TABLE livro_autor (
id_livro_autor INT AUTO_INCREMENT PRIMARY KEY,
id_autor INT NOT NULL,
id_livro INT NOT NULL,
FOREIGN KEY(id_autor) REFERENCES autor (id_autor),
FOREIGN KEY(id_livro) REFERENCES livro (id_livro)
);

CREATE TABLE categoria (
id_categoria INT AUTO_INCREMENT PRIMARY KEY,
categoria VARCHAR(50) NOT NULL
);

CREATE TABLE livro_categoria(
id_livro_categoria INT AUTO_INCREMENT PRIMARY KEY,
id_livro INT NOT NULL,
id_categoria INT NOT NULL,
FOREIGN KEY (id_livro) REFERENCES livro(id_livro),
FOREIGN KEY(id_categoria) REFERENCES categoria(id_categoria)
);

CREATE TABLE nivel (
id_nivel INT AUTO_INCREMENT PRIMARY KEY,
nivel VARCHAR(100) NOT NULL
);

CREATE TABLE usuario (
id_usuario INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
numero_identificacao INT NOT NULL,
email VARCHAR(100) NOT NULL,
dt_cadastro DATE NOT NULL,
id_nivel INT NOT NULL,
FOREIGN KEY (id_nivel) REFERENCES nivel (id_nivel)
);

CREATE TABLE emprestimo (
id_emprestimo INT AUTO_INCREMENT PRIMARY KEY,
dt_emprestimo DATE NOT NULL,
dt_limite DATE NOT NULL,
dt_devolucao DATE NOT NULL,
id_usuario INT NOT NULL,
id_livro INT NOT NULL,
FOREIGN KEY (id_livro) REFERENCES livro(id_livro),
FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario)
);

ALTER TABLE emprestimo MODIFY COLUMN dt_devolucao DATE NULL;


INSERT INTO livro (titulo, isbn, descricao)
VALUES
('O Senhor dos Anéis: Volume único','9364781928374','Este volume está composto pela primeira (A Sociedade do Anel), segunda (As Duas Torres) e terceira parte (O Retorno do Rei) da grande obra de ficção fantástica de J. R. R. Tolkien, O Senhor dos Anéis.
É impossível transmitir ao novo leitor todas as qualidades e o alcance do livro. Alternadamente cômica, singela, épica, monstruosa e diabólica, a narrativa desenvolve-se em meio a inúmeras mudanças de cenários e de personagens, num mundo imaginário absolutamente convincente em seus detalhes. Nas palavras do romancista Richard Hughes, “quanto à amplitude imaginativa, a obra praticamente não tem paralelos e é quase igualmente notável na sua vividez e na habilidade narrativa, que mantêm o leitor preso página após página”.
Tolkien criou em O Senhor dos Anéis uma nova mitologia num mundo inventado que demonstrou possuir um poder de atração atemporal.'),
('O Pequeno Príncipe','3678123487465','" O Pequeno Príncipe ", escrito pelo francês Antoine de Saint-Exupéry, é uma obra atemporal que 
encanta leitores de todas as idades desde sua publicação em 1943."O Pequeno Príncipe", escrito por Antoine de Saint-Exupéry, 
narra a história de um príncipe que deixa seu minúsculo planeta e viaja pelo universo. Durante sua jornada, ele encontra várias 
personagens que representam diferentes aspectos da natureza humana. Na Terra, ele conhece um aviador perdido no deserto e uma raposa 
que lhe ensina valiosas lições sobre amor e amizade.'),
('Verity', '5263874561786', 'Verity Crawford é a autora best-seller por trás de uma série de sucesso. Ela está no auge de sua carreira, aclamada pela crítica e pelo público, no entanto, 
um súbito e terrível acidente acaba interrompendo suas atividades, deixando-a sem condições de concluir a história... E é nessacomplexa circunstância que surge Lowen Ashleigh,
 uma escritora à beira da falência convidada a escrever, sob um pseudônimo, os três livros restantes da já consolidada série'),
('Coisa de rico: A vida dos endinheirados brasileiros', '1763542984567', 'á um traço comum a boa parte dos endinheirados brasileiros: eles não se consideram ricos. Não existe
 um critério absoluto para a riqueza no Brasil. Sempre haverá alguém com mais dinheiro, mais pompa, mais patrimônio, mais próximo do topo da pirâmide. Logo, os ricos são 
 sempre os outros. '),
('O homem mais rico da Babilônia','6532876300987','Baseando-se nos segredos de sucesso dos antigos babilônicos ― os habitantes da cidade mais rica e próspera de seu tempo ―, 
George S. Clason mostra soluções ao mesmo tempo sábias e muito atuais para evitar a falta de dinheiro, como não desperdiçar recursos durante tempos de opulência, buscar 
conhecimento e informação em vez de apenas lucro, assegurar uma renda para o futuro, manter a pontualidade no pagamento de dívidas e, sobretudo, cultivar as próprias aptidões,
 tornando-se cada vez mais habilidoso e consciente.');
 
INSERT INTO livro (titulo, isbn, descricao)
VALUES
('Um lugar bem longe daqui','65287365908237','Por anos, boatos sobre Kya Clark, a “Menina do Brejo”, assombraram Barkley Cove, uma calma cidade costeira da Carolina do Norte. 
Ela, no entanto, não é o que todos dizem. Sensata e inteligente, Kya sobreviveu por anos sozinha no pântano que chama de lar, tendo as gaivotas como amigas e a areia como 
professora. Abandonada pela mãe, que não conseguiu suportar o marido abusivo e alcoólatra, e depois pelos irmãos, a menina viveu algum tempo na companhia negligente e por 
vezes brutal do pai, que acabou também por deixá-la.'),
('Nunca minta','6523448977645','Tricia e Ethan estão em busca da casa dos seus sonhos. Recém-casados, eles vão visitar um casarão antigo no meio de uma floresta no estado de
 Nova York. No entanto, durante a viagem até a mansão que pertenceu à Dra. Adrienne Hale – uma renomada psiquiatra que desapareceu sem deixar vestígio três anos antes –, 
 uma nevasca terrível começa a cair. Quando chegam ao destino, Tricia percebe de cara que há algo de errado; afinal, por que haveria uma luz acesa no segundo andar de uma 
 casa vazia há tanto tempo?'),
('O detento', '6654322677777', 'No primeiro dia de trabalho em uma prisão de segurança máxima, a enfermeira Brooke Sullivan aprende três regras cruciais: 1) 
tratar todos os detentos com respeito, 2) nunca revelar nenhuma informação pessoal e 3) jamais ser simpática demais com os presos.
Ninguém sabe que Brooke já quebrou todas elas.
E ninguém sabe de sua íntima ligação com Shane Nelson, um dos detentos mais infames e perigosos da penitenciária.
Nem que, na escola, Brooke namorou Shane – na época um atleta estelar, o menino de ouro condenado à prisão perpétua por uma série de assassinatos sinistros.
Muito menos que o testemunho de Brooke foi crucial para colocá-lo atrás das grades.
Mas Shane sabe. E ele nunca esquecerá.'),
('Sua Inocência, Minha Vingança','6665344298765','Quando o pai desaparece, Aurora Salles entra no submundo paulistano em busca de respostas — e dá de cara com Bastian Valente,
 o anti-herói que jurou transformar a própria vingança em justiça. Entre ameaças veladas, contratos temporários e um acordo de limites claros (safe word, transparência, 
 aftercare), o que começa como isca vira parceria. E o que parecia puro controle se revela escolha. Ambientado em São Paulo — chuva na janela, vidro e aço, docas e auditórios
 lotados — este romance mescla tensão criminosa, química intensa, e um arco poderoso de redenção. Aurora não é moeda; é voz. Bastian não é só sombra; é homem aprendendo a 
 amar no claro. Juntos, eles derrubam um Conselho corrupto à luz das câmeras e reescrevem o pacto que dá nome à história: não é sua inocência nem minha vingança — é nossa 
vida.');

 

INSERT INTO autor (nome, data_nascimento, biografia)
VALUES
('Alisson Bento','1980-09-05','Alisson Bento é um autor brasileiro que mergulha nas profundezas da alma humana através do dark romance, gênero onde paixão, dor e desejo se entrelaçam de forma intensa e visceral. Com uma escrita provocativa e emocionalmente carregada, Alisson cria personagens marcados por traumas, segredos e redenções, explorando os limites do amor e da obsessão.'),
('DELIA OWENS','1998-04-01','cientista e escritora, coautora de três best-sellers que exploram suas jornadas à África. Já ganhou o John Burroughs Award for Nature Writing e teve artigos publicados em diversos periódicos, como Nature, The African Journal of Ecologye International Wildlife.'),
('Freida McFadden','1999-04-23','Freida McFadden é uma médica especialista em lesões cerebrais e autora americana de best-sellers de thrillers psicológicos, conhecida por livros como A Empregada (The Housemaid). Ela nasceu em Nova York, formou-se em medicina em Harvard e publicou seu primeiro livro em 2013, tornando-se uma autora de sucesso internacional com obras traduzidas para mais de 45 idiomas. McFadden mora em Boston com a família e o gato, e uma adaptação cinematográfica de The Housemaid está em produção para a Lionsgate. '),
('J.R.R. Tolkien','1982-03-03','foi um escritor, filólogo e professor universitário inglês, mundialmente conhecido por O Hobbit e O Senhor dos Anéis, cujas obras criaram o universo da Terra-média. Nascido na África do Sul, estudou em Oxford, especializando-se em línguas e literatura antigas, e foi professor de inglês antigo e médio. Suas obras, que combinam elementos de mitologia e contos de fadas, foram inspiradas pela sua fé católica, o amor pela Idade Média e suas experiências na Primeira Guerra Mundial. '),
('Fernanda Broks','1972-10-10','Fernanda Broks é uma escritora brasileira com alma cosmopolita. Nascida em Florianópolis, passou parte da juventude na Europa, onde se apaixonou pela literatura existencialista. Sua escrita é marcada por reflexões profundas sobre identidade, pertencimento e memória, mesclando realismo e lirismo. Seu romance de estreia, Entre as Marés, foi aclamado pela crítica por sua prosa poética e sensível.'),
('Niklaus Mikels','1976-09-10','Niklaus Mikels é um autor suíço especializado em ficção científica e thrillers psicológicos. Com formação em neurociência, suas histórias exploram os limites da mente humana, inteligência artificial e dilemas éticos do futuro. Seu livro mais conhecido, O Véu de Chronos, tornou-se um best-seller internacional e foi adaptado para o cinema em 2023.'),
('Rebeca Oliveira','1988-05-26','Rebeca Oliveira é uma romancista e poeta nascida em Recife. Com uma linguagem envolvente e rica em regionalismos, ela transforma experiências cotidianas em narrativas emocionantes. Seu livro de poesia Cais de Dentro recebeu diversos prêmios nacionais, destacando sua voz autêntica e feminina na literatura contemporânea brasileira.'),
('Emanuel Justos','1925-07-02','Emanuel Justos é um autor português conhecido por suas narrativas históricas repletas de detalhes e drama. Com formação em História Medieval, ele recria épocas passadas com precisão e sensibilidade. Seu romance O Herdeiro do Silêncio conquistou leitores em diversos países lusófonos, consolidando seu nome entre os grandes escritores da nova geração.'),
('Elizabeth Bonjorno','1922-10-09','Elizabeth Bonjorno é uma escritora ítalo-americana que mistura romance e mistério em suas obras ambientadas em pequenas cidades da Toscana. Seus livros, geralmente protagonizados por mulheres fortes e independentes, exploram temas como segredos de família, arte e reconciliação. Seu mais recente sucesso, As Janelas de Lucca, foi traduzido para mais de 15 idiomas.'),
('Clementina Garcia','1965-09-28','Clementina Garcia é uma autora chilena de literatura infantojuvenil, conhecida por criar mundos mágicos e personagens cativantes. Ex-professora de literatura, ela começou a escrever para seus alunos e nunca mais parou. Sua série As Aventuras de Nube, protagonizada por uma menina curiosa e inventiva, é um fenômeno entre crianças e jovens leitores da América Latina.');

INSERT INTO categoria(categoria)
VALUES
('Romance'),
('Ficção Científica'),
('Fantasia'),
('Mistério / Suspense'),
('Terror / Horror'),
('Ficção Histórica'),
('Literatura Infantojuvenil'),
('Biografia'),
('Autoajuda'),
('Reportagem Literária');

INSERT INTO livro_autor(id_livro, id_autor) 
VALUES
(7,1),
(1,9),
(2,8),
(5,6),
(4,10),
(8,4),
(10,3),
(3,2),
(6,7),
(9,5);

INSERT INTO livro_categoria(id_livro, id_categoria)
VALUES
(1, 1),  
(2, 2),  
(3, 3),  
(4, 4), 
(5, 5),  
(6, 6), 
(7, 7), 
(8, 8),  
(9, 9),  
(10, 10);

INSERT INTO nivel(nivel)
VALUES
('Básico'),
('Intermediário'),
('Avançado');

INSERT INTO usuario (nome, numero_identificacao, email, dt_cadastro, id_nivel)
VALUES
('Ana Souza', 1001, 'ana.souza@example.com', '2025-08-01', 1),
('Bruno Lima', 1002, 'bruno.lima@example.com', '2025-08-02', 2),
('Carla Mendes', 1003, 'carla.mendes@example.com', '2025-08-03', 1),
('Daniel Torres', 1004, 'daniel.torres@example.com', '2025-08-04', 3),
('Eduarda Martins', 1005, 'eduarda.martins@example.com', '2025-08-05', 2),
('Felipe Rocha', 1006, 'felipe.rocha@example.com', '2025-08-06', 3),
('Gabriela Pires', 1007, 'gabriela.pires@example.com', '2025-08-07', 1),
('Henrique Alves', 1008, 'henrique.alves@example.com', '2025-08-08', 2),
('Isabela Nunes', 1009, 'isabela.nunes@example.com', '2025-08-09', 3),
('João Pedro Vieira', 1010, 'joao.pedro@example.com', '2025-08-10', 2);

INSERT INTO emprestimo (dt_emprestimo, dt_limite, dt_devolucao, id_usuario, id_livro)
VALUES
('2025-08-01', '2025-08-15', '2025-08-14', 1, 3),
('2025-08-03', '2025-08-17', NULL, 2, 5),
('2025-07-25', '2025-08-08', '2025-08-07', 3, 1),
('2025-08-05', '2025-08-19', NULL, 4, 7),
('2025-08-02', '2025-08-16', '2025-08-15', 5, 4),
('2025-08-06', '2025-08-20', NULL, 6, 2),
('2025-07-30', '2025-08-13', '2025-08-12', 7, 8),
('2025-08-04', '2025-08-18', NULL, 8, 9),
('2025-07-28', '2025-08-11', '2025-08-10', 9, 6),
('2025-08-07', '2025-08-21', NULL, 10, 10);
