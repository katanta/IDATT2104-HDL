# IDATT2104-HDL

## ⚙ Setup
Minstekravet for å få kjørt koden er: 
- iverilog
- yosys

## 🚀 Kjøring av programmet
For å kjøre alle simulasjonene, kjør: 
```
make sim
```
Man kan også kjøre simulasjonene individuelt. Disse kan sjekkes ut i [Makefilen](https://github.com/Katanta/IDATT2104-HDL/blob/main/Makefile).

### Elementvis multiplikasjon
Simulasjonen for elementvis multiplikasjon kan du kjøre med: 
```
make sim_elementwise_multiplication
```
Denne kjøres sekvensielt. For parallell kjøring, bruk: 
```
make sim_parallel_elementwise_multiplication
```
TODO: Forklaring

### Dot produkt
Simulasjonen for prikkprodukt kan du kjøre med: 
```
make sim_dot_product
```
TODO: Forklaring

### Flyttallsaritmetikk
Simulasjonen for flyttallsmultiplikasjon kan du kjøre med:
```
make sim_float
```
Denne kjører alle regnestykkene for alle typer flyttall (8, 16 og 32 bit)
TODO: Forklar dette