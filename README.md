# Contador com Display de 7 Segmentos em Verilog

## Descrição

Este projeto implementa um **contador digital em Verilog** que incrementa um valor a cada segundo e exibe o resultado em um **display de 7 segmentos**. O contador varia de **0 até 6** e reinicia automaticamente após atingir o valor máximo.

O circuito foi projetado para operar com um **clock de 27 MHz**, utilizando um **divisor de frequência** para gerar um pulso equivalente a **1 segundo**.

Este tipo de implementação é comum em projetos de **FPGA**, sendo útil para aprendizado de:

- lógica sequencial
- divisores de clock
- controle de displays de 7 segmentos
- desenvolvimento em HDL (Hardware Description Language)

---

## Estrutura do Módulo

O módulo principal é:

```

contador

```

### Entradas

| Sinal | Tipo | Descrição |
|------|------|-----------|
| `clk` | wire | Clock de 27 MHz |
| `reset_n` | wire | Reset assíncrono ativo em nível baixo |

### Saídas

| Sinal | Tipo | Descrição |
|------|------|-----------|
| `seg[6:0]` | reg | Controle dos segmentos do display |

---

## Funcionamento

O sistema possui dois blocos principais:

### 1. Divisor de Clock

O clock de **27 MHz** é dividido para gerar um pulso de **1 segundo**.

```

CLK_FREQ = 27.000.000

```

Após atingir esse valor, o contador interno é reiniciado e o valor exibido no display é incrementado.

---

### 2. Contador

O registrador `valor` armazena os números:

```

0 → 1 → 2 → 3 → 4 → 5 → 6 → 0

```

O contador é reiniciado automaticamente após atingir **6**.

---

### 3. Decodificador de 7 Segmentos

Um bloco `case` converte o valor binário para o padrão correspondente no **display de 7 segmentos (cátodo comum)**.

Exemplo:

| Número | Segmentos |
|------|------|
| 0 | 1111110 |
| 1 | 0110000 |
| 2 | 1101101 |
| 3 | 1111001 |
| 4 | 0110011 |
| 5 | 1011011 |
| 6 | 1011111 |

---

## Arquitetura do Sistema

```

Clock 27 MHz
│
▼
Divisor de Frequência
│
▼
Contador (0 → 6)
│
▼
Decodificador 7 Segmentos
│
▼
Display

```

---

## Requisitos de Hardware

Este código pode ser sintetizado em diversas plataformas FPGA, como:

- Intel/Altera
- Xilinx
- Lattice

É necessário:

- FPGA
- Display de 7 segmentos (cátodo comum)
- Clock de 27 MHz

---

## Reset do Sistema

O reset é **assíncrono e ativo em nível baixo**:

```

reset_n = 0 → reinicia o contador
reset_n = 1 → funcionamento normal

```

---

## Aplicações

Este projeto pode ser utilizado em:

- estudos de lógica digital
- experimentos em FPGA
- temporizadores simples
- contadores digitais
- demonstrações acadêmicas

---

## Autor

Prof. Vitor Amadeu

---

## Licença

Este projeto pode ser utilizado para fins educacionais e acadêmicos.
