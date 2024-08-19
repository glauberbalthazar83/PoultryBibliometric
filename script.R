library(bibliometrix)

S <- convert2df("G:/Arquivos/academico/2024-1/ESALQ/Tese/RevisaoBibliografica/texto/resultados/2014-2024_2/scopus.csv", dbsource = "scopus", format = "csv")
W <- convert2df("G:/Arquivos/academico/2024-1/ESALQ/Tese/RevisaoBibliografica/texto/resultados/2014-2024_2/savedrecs.txt", dbsource = "wos", format = "plaintext")
U <- mergeDbSources(S, W, remove.duplicated = TRUE)

write.table(U, "G:/Arquivos/academico/2024-1/ESALQ/Tese/RevisaoBibliografica/texto/resultados/2014-2024_2/dadosbiblio.csv", sep = ";", row.names = FALSE)

P <- U[,c("DI", "PY", "AU", "TI", "SO", "DT", "DE", "TC")]
write.table(P, "G:/Arquivos/academico/2024-1/ESALQ/Tese/RevisaoBibliografica/texto/resultados/2014-2024_2/dadosbibliosel.csv", sep = ";", row.names = FALSE)

Res <- biblioAnalysis(U)

DS <- summary(object = Res, k = 20)

plot(Res, k=20)