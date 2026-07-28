# Code Page Character Encoding

## Introduction

Building upon the foundational `pst-led` package and a thorough understanding of dot matrix character rendering, it is a natural extension to develop a character set based on Unicode code points. Where, each code point corresponds to one dot matrix character represented by an 8-bit binary sequence, articuable via a decimal number or [coded character set](#coded-character-set) of [Unicode code point](https://en.wikipedia.org/wiki/List_of_Unicode_characters).

### [Suggestion by quark67](https://github.com/manthanwar/pst-art/issues/3)

For example, on [https://github.com/manthanwar/pst-art/blob/main/pst-led/code/pst-led-o.sty](https://github.com/manthanwar/pst-art/blob/main/pst-led/code/pst-led-o.sty) we read on lines 481–491:

```latex
% region \psLedA
\newcommand{\psLedA}[1][]{\rput(0,0){\psLedBack}%
\ledOn[0](0,6) \ledOn[1](1,6) \ledOn[1](2,6) \ledOn[1](3,6) \ledOn[0](4,6)%
\ledOn[1](0,5) \ledOn[0](1,5) \ledOn[0](2,5) \ledOn[0](3,5) \ledOn[1](4,5)%
\ledOn[1](0,4) \ledOn[0](1,4) \ledOn[0](2,4) \ledOn[0](3,4) \ledOn[1](4,4)%
\ledOn[1](0,3) \ledOn[1](1,3) \ledOn[1](2,3) \ledOn[1](3,3) \ledOn[1](4,3)%
\ledOn[1](0,2) \ledOn[0](1,2) \ledOn[0](2,2) \ledOn[0](3,2) \ledOn[1](4,2)%
\ledOn[1](0,1) \ledOn[0](1,1) \ledOn[0](2,1) \ledOn[0](3,1) \ledOn[1](4,1)%
\ledOn[1](0,0) \ledOn[0](1,0) \ledOn[0](2,0) \ledOn[0](3,0) \ledOn[1](4,0)%
}%
% endregion \psLedA
```

The series of `\ledOn[s](x,y)` (s for state, 0 = off, 1 = on) is for coding this:

```text
.XXX.
X...X
X...X
XXXXX
X...X
X...X
X...X
```

which gives the shape of the A letter (X = on, . = off).

This can be converted in a binary form (1 = on, 0 = off):

```text
00001110
00010001
00010001
00011111
00010001
00010001
00010001
```

and so to:

```text
14
17
17
31
17
17
17
```

So, the command can be modified as:

```latex
\newcommand{\psLedA}{\createMatrixDots{14,17,17,31,17,17,17}}
```

with a generalized command `\createMatrixDots` (to be created).

As you present your code as: We investigate the intersection of computational design, algorithmic aesthetics, it would be better than a list like `\ledOn[0](0,6) \ledOn[1](1,6) \ledOn[1](2,6) \ledOn[1](3,6) \ledOn[0](4,6)%`.

## Background

### Binary Representation

There are 256 unique 8-digit binary combinations, starting from 00000000, ending at 11111111, and passing through the midpoint 10000000. These 8-bit sequences form a single byte, which computers use to represent values like numbers and letters.

#### Key Statistics

* Total combinations: 256 (2⁸)
* Bit length: 8 bits per sequence
* Decimal range: 0 through 255

#### Example Patterns

* Start: 00000000 (Decimal 0)
* Middle: 10000000 (Decimal 128)
* End: 11111111 (Decimal 255)

### Code Point and Character Encoding

In computing, a [code page](https://en.wikipedia.org/wiki/Code_page) is a [character encoding](https://en.wikipedia.org/wiki/Character_encoding) and as such it is a specific association of a set of printable characters and control characters with unique numbers. A code page is a table that matches numbers to letters, numbers, and symbols. It is a specific type of character encoding used by computers to display and print text for different languages correctly.

#### How Code Pages Work

* Number mapping: Each letter or symbol gets a specific number value (code point).
* Standard base: Most traditional code pages use 256 combinations in a single byte, where the first 128 characters match standard ASCII.

### Unicode Standard

[Unicode](https://en.wikipedia.org/wiki/Unicode) and its parallel standard, the ISO/IEC 10646 [Universal Character Set](https://en.wikipedia.org/wiki/Universal_Coded_Character_Set), together constitute a unified standard for character encoding. Rather than mapping characters directly to bytes, Unicode separately defines a coded character set that maps characters to unique natural numbers (code points), how those code points are mapped to a series of fixed-size natural numbers (code units), and finally how those units are encoded as a stream of octets (bytes).

#### Coded character set

A coded character set (CCS) is a [function](https://en.wikipedia.org/wiki/Function_(mathematics)) that maps characters to [code points](https://en.wikipedia.org/wiki/Code_point) (each code point represents one character). For example, in a given repertoire, the capital letter "A" in the Latin alphabet might be represented by the code point 65, the character "B" by 66, and so on. Multiple coded character sets may share the same character repertoire; for example [ISO/IEC 8859-1](https://en.wikipedia.org/wiki/ISO/IEC_8859-1) and IBM code pages 037 and 500 all cover the same repertoire but map them to different code points.

The Unicode code points for uppercase letters A to Z run from U+0041 to U+005A (decimal 65 to 90) and lowercase letters a to z run from U+0061 to U+007A (decimal 97 to 122).

##### Uppercase Letters (A – Z)

* A to E: U+0041 to U+0045 (Decimal 65–69)
* F to J: U+0046 to U+004A (Decimal 70–74)
* K to O: U+004B to U+004F (Decimal 75–79)
* P to T: U+0050 to U+0054 (Decimal 80–84)
* U to Z: U+0055 to U+005A (Decimal 85–90)

##### Lowercase Letters (a – z)

* a to e: U+0061 to U+0065 (Decimal 97–101)
* f to j: U+0066 to U+006A (Decimal 102–106)
* k to o: U+006B to U+006F (Decimal 107–111)
* p to t: U+0070 to U+0074 (Decimal 112–116)
* u to z: U+0075 to U+007A (Decimal 117–122)

### Binary to Decimal Conversion

Table of Integers 0 to 255, in Decimal and Binary

| Dec | Binary   | Dec | Binary   | Dec | Binary   | Dec | Binary   |
| --: | :------: | --: | :------: | --: | :------: | --: | :------: |
| 000 | 00000000 | 064 | 01000000 | 128 | 10000000 | 192 | 11000000 |
| 001 | 00000001 | 065 | 01000001 | 129 | 10000001 | 193 | 11000001 |
| 002 | 00000010 | 066 | 01000010 | 130 | 10000010 | 194 | 11000010 |
| 003 | 00000011 | 067 | 01000011 | 131 | 10000011 | 195 | 11000011 |
| 004 | 00000100 | 068 | 01000100 | 132 | 10000100 | 196 | 11000100 |
| 005 | 00000101 | 069 | 01000101 | 133 | 10000101 | 197 | 11000101 |
| 006 | 00000110 | 070 | 01000110 | 134 | 10000110 | 198 | 11000110 |
| 007 | 00000111 | 071 | 01000111 | 135 | 10000111 | 199 | 11000111 |
| 008 | 00001000 | 072 | 01001000 | 136 | 10001000 | 200 | 11001000 |
| 009 | 00001001 | 073 | 01001001 | 137 | 10001001 | 201 | 11001001 |
| 010 | 00001010 | 074 | 01001010 | 138 | 10001010 | 202 | 11001010 |
| 011 | 00001011 | 075 | 01001011 | 139 | 10001011 | 203 | 11001011 |
| 012 | 00001100 | 076 | 01001100 | 140 | 10001100 | 204 | 11001100 |
| 013 | 00001101 | 077 | 01001101 | 141 | 10001101 | 205 | 11001101 |
| 014 | 00001110 | 078 | 01001110 | 142 | 10001110 | 206 | 11001110 |
| 015 | 00001111 | 079 | 01001111 | 143 | 10001111 | 207 | 11001111 |
| 016 | 00010000 | 080 | 01010000 | 144 | 10010000 | 208 | 11010000 |
| 017 | 00010001 | 081 | 01010001 | 145 | 10010001 | 209 | 11010001 |
| 018 | 00010010 | 082 | 01010010 | 146 | 10010010 | 210 | 11010010 |
| 019 | 00010011 | 083 | 01010011 | 147 | 10010011 | 211 | 11010011 |
| 020 | 00010100 | 084 | 01010100 | 148 | 10010100 | 212 | 11010100 |
| 021 | 00010101 | 085 | 01010101 | 149 | 10010101 | 213 | 11010101 |
| 022 | 00010110 | 086 | 01010110 | 150 | 10010110 | 214 | 11010110 |
| 023 | 00010111 | 087 | 01010111 | 151 | 10010111 | 215 | 11010111 |
| 024 | 00011000 | 088 | 01011000 | 152 | 10011000 | 216 | 11011000 |
| 025 | 00011001 | 089 | 01011001 | 153 | 10011001 | 217 | 11011001 |
| 026 | 00011010 | 090 | 01011010 | 154 | 10011010 | 218 | 11011010 |
| 027 | 00011011 | 091 | 01011011 | 155 | 10011011 | 219 | 11011011 |
| 028 | 00011100 | 092 | 01011100 | 156 | 10011100 | 220 | 11011100 |
| 029 | 00011101 | 093 | 01011101 | 157 | 10011101 | 221 | 11011101 |
| 030 | 00011110 | 094 | 01011110 | 158 | 10011110 | 222 | 11011110 |
| 031 | 00011111 | 095 | 01011111 | 159 | 10011111 | 223 | 11011111 |
| 032 | 00100000 | 096 | 01100000 | 160 | 10100000 | 224 | 11100000 |
| 033 | 00100001 | 097 | 01100001 | 161 | 10100001 | 225 | 11100001 |
| 034 | 00100010 | 098 | 01100010 | 162 | 10100010 | 226 | 11100010 |
| 035 | 00100011 | 099 | 01100011 | 163 | 10100011 | 227 | 11100011 |
| 036 | 00100100 | 100 | 01100100 | 164 | 10100100 | 228 | 11100100 |
| 037 | 00100101 | 101 | 01100101 | 165 | 10100101 | 229 | 11100101 |
| 038 | 00100110 | 102 | 01100110 | 166 | 10100110 | 230 | 11100110 |
| 039 | 00100111 | 103 | 01100111 | 167 | 10100111 | 231 | 11100111 |
| 040 | 00101000 | 104 | 01101000 | 168 | 10101000 | 232 | 11101000 |
| 041 | 00101001 | 105 | 01101001 | 169 | 10101001 | 233 | 11101001 |
| 042 | 00101010 | 106 | 01101010 | 170 | 10101010 | 234 | 11101010 |
| 043 | 00101011 | 107 | 01101011 | 171 | 10101011 | 235 | 11101011 |
| 044 | 00101100 | 108 | 01101100 | 172 | 10101100 | 236 | 11101100 |
| 045 | 00101101 | 109 | 01101101 | 173 | 10101101 | 237 | 11101101 |
| 046 | 00101110 | 110 | 01101110 | 174 | 10101110 | 238 | 11101110 |
| 047 | 00101111 | 111 | 01101111 | 175 | 10101111 | 239 | 11101111 |
| 048 | 00110000 | 112 | 01110000 | 176 | 10110000 | 240 | 11110000 |
| 049 | 00110001 | 113 | 01110001 | 177 | 10110001 | 241 | 11110001 |
| 050 | 00110010 | 114 | 01110010 | 178 | 10110010 | 242 | 11110010 |
| 051 | 00110011 | 115 | 01110011 | 179 | 10110011 | 243 | 11110011 |
| 052 | 00110100 | 116 | 01110100 | 180 | 10110100 | 244 | 11110100 |
| 053 | 00110101 | 117 | 01110101 | 181 | 10110101 | 245 | 11110101 |
| 054 | 00110110 | 118 | 01110110 | 182 | 10110110 | 246 | 11110110 |
| 055 | 00110111 | 119 | 01110111 | 183 | 10110111 | 247 | 11110111 |
| 056 | 00111000 | 120 | 01111000 | 184 | 10111000 | 248 | 11111000 |
| 057 | 00111001 | 121 | 01111001 | 185 | 10111001 | 249 | 11111001 |
| 058 | 00111010 | 122 | 01111010 | 186 | 10111010 | 250 | 11111010 |
| 059 | 00111011 | 123 | 01111011 | 187 | 10111011 | 251 | 11111011 |
| 060 | 00111100 | 124 | 01111100 | 188 | 10111100 | 252 | 11111100 |
| 061 | 00111101 | 125 | 01111101 | 189 | 10111101 | 253 | 11111101 |
| 062 | 00111110 | 126 | 01111110 | 190 | 10111110 | 254 | 11111110 |
| 063 | 00111111 | 127 | 01111111 | 191 | 10111111 | 255 | 11111111 |

## Overall Objective

The endeavor to create character encoding using a numeric value to represent each dot matrix character. Ultimate goal is to create a character set as a collection of characters used to represent all the letter, digits, and symbols using standard dot matrix and generalized pixel art.

## Methodology

### Step 1: Binary to Decimal Conversion

Generate the Binary Form of Each Character and convert it into its Decimal Representation as [suggested by quark67](#suggestion-by-quark67) above.

### Step 2: Decimal to Binary Conversion

Dynamically compute the binary representation of a number in LaTeX usig the Modern LaTeX3 approach that leverages the native LaTeX3 engine (expl3) via the \int_to_base:nn function to programmatically convert any decimal integer into its binary equivalent.

```latex
\documentclass{article}
\usepackage{expl3}

\ExplSyntaxOn
% Create a user-facing command: \tobin{decimal_number}
\NewDocumentCommand{\tobin}{m}{
    \int_to_base:nn {#1} {2}
}
\ExplSyntaxOff

\begin{document}
The binary representation of 42 is \tobin{42}. % Outputs: 101010
\end{document}
```

### Step 3: Map the Binary to PostScript Character

```latex
\newcommand{\createMatrixDots}{(to be created)}
\newcommand{\psLedA}{\createMatrixDots{14,17,17,31,17,17,17}}
```

### Step 4: Generate Code Page Character Set

```latex
\newcommand{\unicodeDecToLed}[1]{%
\ifcase#1
%  000  <control>: NULL
\or
%  001  <control>: START OF HEADING
\or
%  002  <control>: START OF TEXT
\or
%  003  <control>: END OF TEXT
\or
%  004  <control>: END OF TRANSMISSION
\or
%  005  <control>: ENQUIRY
\or
%  006  <control>: ACKNOWLEDGE
\or
%  007  <control>: BELL
\or
%  008  <control>: BACKSPACE
\or
%  009  <control>: HORIZONTAL TABULATION
\or
%  010  <control>: LINE FEED
\or
%  011  <control>: VERTICAL TABULATION
\or
%  012  <control>: FORM FEED
\or
%  013  <control>: CARRIAGE RETURN
\or
%  014  <control>: SHIFT OUT
\or
%  015  <control>: SHIFT IN
\or
%  016  <control>: DATA LINK ESCAPE
\or
%  017  <control>: DEVICE CONTROL ONE
\or
%  018  <control>: DEVICE CONTROL TWO
\or
%  019  <control>: DEVICE CONTROL THREE
\or
%  020  <control>: DEVICE CONTROL FOUR
\or
%  021  <control>: NEGATIVE ACKNOWLEDGE
\or
%  022  <control>: SYNCHRONOUS IDLE
\or
%  023  <control>: END OF TRANSMISSION BLOCK
\or
%  024  <control>: CANCEL
\or
%  025  <control>: END OF MEDIUM
\or
%  026  <control>: SUBSTITUTE
\or
%  027  <control>: ESCAPE
\or
% 028  <control>: FILE SEPARATOR
\or
% 029  <control>: GROUP SEPARATOR
\or
% 030  <control>: RECORD SEPARATOR
\or
% 031  <control>: UNIT SEPARATOR
\or
\psLedOff           % 032     SPACE
\or
\psLedExclamation   % 033  !  EXCLAMATION MARK
\or
\psLedQuoteR        % 034  "  QUOTATION MARK
\or
\psLedHash          % 035  #  NUMBER SIGN
\or
\psLedUSD           % 036  $  DOLLAR SIGN
\or
\psLedPercent       % 037  %  PERCENT SIGN
\or
\psLedAmpersand     % 038  &  AMPERSAND
\or
\psLedQuoteR        % 039  '  APOSTROPHE
\or
\psLedBracketLeft   % 040  (  LEFT PARENTHESIS
\or
\psLedBracketRight  % 041  )  RIGHT PARENTHESIS
\or
% 042  *  ASTERISK
\or
\psLedPlus          % 043  +  PLUS SIGN
\or
\psLedComma         % 044  ,  COMMA
\or
\psLedDash          % 045  -  HYPHEN-MINUS
\or
\psLedPeriod        %  046  .  FULL STOP
\or
\psLedSlash         %  047  /  SOLIDUS
\or
\psLedNJ %  048  0  DIGIT ZERO
\or
\psLedNA %  049  1  DIGIT ONE
\or
\psLedNB %  050  2  DIGIT TWO
\or
\psLedNC %  051  3  DIGIT THREE
\r
\psLedND %  052  4  DIGIT FOUR
\or
\psLedNE %  053  5  DIGIT FIVE
\or
\psLedNF %  054  6  DIGIT SIX
\or
\psLedNG %  055  7  DIGIT SEVEN
\or
\psLedNH %  056  8  DIGIT EIGHT
\or
\psLedNI %  057  9  DIGIT NINE
\or
\psLedColon        %  058  :  COLON
\or
\psLedSemiColon       %  059  ;  SEMICOLON
\or
% 060  <  LESS-THAN SIGN
\or
\psLedEqual           %  061  =  EQUALS SIGN
\or
% 062  >  GREATER-THAN SIGN
\or
\psLedQuestion       %  063  ?  QUESTION MARK
\or
\psLedCommercialAt    % 064  @  COMMERCIAL AT
\or
\psLedA  %  065  A  LATIN CAPITAL LETTER A
\or
\psLedB  %  066  B  LATIN CAPITAL LETTER B
\or
\psLedC  %  067  C  LATIN CAPITAL LETTER C
\or
\psLedD  %  068  D  LATIN CAPITAL LETTER D
\or
\psLedE  % 069  E  LATIN CAPITAL LETTER E
\or
\psLedF  % 070  F  LATIN CAPITAL LETTER F
\or
\psLedG  % 071  G  LATIN CAPITAL LETTER G
\or
\psLedH  %  072  H  LATIN CAPITAL LETTER H
\or
\psLedI  %  073  I  LATIN CAPITAL LETTER I
\or
\psLedJ  %  074  J  LATIN CAPITAL LETTER J
\or
\psLedK  %  075  K  LATIN CAPITAL LETTER K
\or
\psLedL  %  076  L  LATIN CAPITAL LETTER L
\or
\psLedM  %  077  M  LATIN CAPITAL LETTER M
\or
\psLedN  %  078  N  LATIN CAPITAL LETTER N
\or
\psLedO  %  079  O  LATIN CAPITAL LETTER O
\or
\psLedP  %  080  P  LATIN CAPITAL LETTER P
\or
\psLedQ  %  081  Q  LATIN CAPITAL LETTER Q
\or
\psLedR  %  082  R  LATIN CAPITAL LETTER R
\or
\psLedS  %  083  S  LATIN CAPITAL LETTER S
\or
\psLedT  %  084  T  LATIN CAPITAL LETTER T
\or
\psLedU  %  085  U  LATIN CAPITAL LETTER U
\or
\psLedV  %  086  V  LATIN CAPITAL LETTER V
\or
\psLedW  %  087  W  LATIN CAPITAL LETTER W
\or
\psLedX  %  088  X  LATIN CAPITAL LETTER X
\or
\psLedY  %  089  Y  LATIN CAPITAL LETTER Y
\or
\psLedZ  %  090  Z  LATIN CAPITAL LETTER Z
\or
\psLedBracketSquareLeft % 091  [  LEFT SQUARE  BRACKET
\or
\psLedBackslash       % 092  \  REVERSE SOLIDUS
\or
\psLedBracketSquareRight % 093  ]  RIGHT SQUARE BRACKET
\or
%  094  ^  CIRCUMFLEX ACCENT
\or
\psLedUnderscore   %  095  _  LOW LINE
\or
\psLedQuoteL       %  096  `  GRAVE ACCENT
\or
\psLeda  %  097  a  LATIN SMALL LETTER A
\or
\psLedb  %  098  b  LATIN SMALL LETTER B
\or
\psLedc  %  099  c  LATIN SMALL LETTER C
\or
\psLedd  %  100  d  LATIN SMALL LETTER D
\or
\psLede  %  101  e  LATIN SMALL LETTER E
\or
\psLedf  %  102  f  LATIN SMALL LETTER F
\or
\psLedg  %  103  g  LATIN SMALL LETTER G
\or
\psLedh  %  104  h  LATIN SMALL LETTER H
\or
\psLedi  %  105  i  LATIN SMALL LETTER I
\or
\psLedj  %  106  j  LATIN SMALL LETTER J
\or
\psLedk  %  107  k  LATIN SMALL LETTER K
\or
\psLedl  %  108  l  LATIN SMALL LETTER L
\or
\psLedm  %  109  m  LATIN SMALL LETTER M
\or
\psLedn  %  110  n  LATIN SMALL LETTER N
\or
\psLedo  %  111  o  LATIN SMALL LETTER O
\or
\psLedp  %  112  p  LATIN SMALL LETTER P
\or
\psLedq  %  113  q  LATIN SMALL LETTER Q
\or
\psLedr  %  114  r  LATIN SMALL LETTER R
\or
\psLeds  %  115  s  LATIN SMALL LETTER S
\or
\psLedt  %  116  t  LATIN SMALL LETTER T
\or
\psLedu  %  117  u  LATIN SMALL LETTER U
\or
\psLedv  %  118  v  LATIN SMALL LETTER V
\or
\psLedw  %  119  w  LATIN SMALL LETTER W
\or
\psLedx  %  120  x  LATIN SMALL LETTER X
\or
\psLedy  %  121  y  LATIN SMALL LETTER Y
\or
\psLedz  %  122  z  LATIN SMALL LETTER Z
\or
%  123  {  LEFT CURLY BRACKET
\or
%  124  |  VERTICAL LINE
\or
%  125  }  RIGHT CURLY BRACKET
\or
%  126  ~  TILDE
\or
%  127     <control>: DELETE
\or
\psLedEUR    % 128  €  <control>:
\or
% 129  <control>:
\or
%  130  ‚  <control>: BREAK PERMITTED HERE
\or
%  131  ƒ  <control>: NO BREAK HERE
\or
%  132  „  <control>:
\or
%  133  …  <control>: NEXT LINE
\or
%  134  †  <control>: START OF SELECTED AREA
\or
%  135  ‡  <control>: END OF SELECTED AREA
\or
%  136  ˆ  <control>: CHARACTER TABULATION SET
\or
%  137  ‰  <control>: CHARACTER TABULATION WITH JUSTIFICATION
\or
%  138  Š  <control>: LINE TABULATION SET
\or
%  139  ‹  <control>: PARTIAL LINE DOWN
\or
%  140  Œ  <control>: PARTIAL LINE UP
\or
%  141     <control>: REVERSE LINE FEED
\or
%  142  Ž  <control>: SINGLE SHIFT TWO
\or
%  143     <control>: SINGLE SHIFT THREE
\or
%  144     <control>: DEVICE CONTROL STRING
\or
%  145  ‘  <control>: PRIVATE USE ONE
\or
%  146  ’  <control>: PRIVATE USE TWO
\or
%  147  “  <control>: SET TRANSMIT STATE
\or
%  148  ”  <control>: CANCEL CHARACTER
\or
%  149  •  <control>: MESSAGE WAITING
\or
%  150  –  <control>: START OF GUARDED AREA
\or
%  151  — <control>: END OF GUARDED AREA
\or
%  152  ˜ <control>: START OF STRING
\or
%  153  ™ <control>:
\or
%  154  š  <control>: SINGLE CHARACTER INTRODUCER
\or
%  155  ›  <control>: CONTROL SEQUENCE INTRODUCER
\or
%  156  œ  <control>: STRING TERMINATOR
\or
%  157  <control>: OPERATING SYSTEM COMMAND
\or
%  158  ž  <control>: PRIVACY MESSAGE
\or
%  159  Ÿ  <control>: APPLICATION PROGRAM COMMAND
\or
%  160     NO-BREAK SPACE
\or
%  161  ¡  INVERTED EXCLAMATION MARK
\or
%  162  ¢  CENT SIGN
\or
\psLedGBP           %  163  £  POUND SIGN
\or
%  164  ¤  CURRENCY SIGN
\or
\psLedYEN                %  165  ¥  YEN SIGN
\or
%  166  ¦  BROKEN BAR
\or
%  167  §  SECTION SIGN
\or
%  168  ¨  DIAERESIS
\or
%  169  ©  COPYRIGHT SIGN
\or
%  170  ª  FEMININE ORDINAL INDICATOR
\or
%  171  «  LEFT-POINTING DOUBLE ANGLE QUOTATION MARK
\or
%  172  ¬  NOT SIGN
\or
%  173     SOFT HYPHEN
\or
%  174  ®  REGISTERED SIGN
\or
%  175  ¯  MACRON
\or
\psLedDegree %  176  °  DEGREE SIGN
\or
%  177  ±  PLUS-MINUS SIGN
\or
%  178  ²  SUPERSCRIPT TWO
\or
%  179  ³  SUPERSCRIPT THREE
\or
%  180  ´  ACUTE ACCENT
\or
%  181  µ  MICRO SIGN
\or
%  182  ¶  PILCROW SIGN
\or
%  183  ·  MIDDLE DOT
\or
%  184  ¸  CEDILLA
\or
%  185  ¹  SUPERSCRIPT ONE
\or
%  186  º  MASCULINE ORDINAL INDICATOR
\or
%  187  »  RIGHT-POINTING DOUBLE ANGLE QUOTATION MARK
\or
%  188  ¼  VULGAR FRACTION ONE QUARTER
\or
%  189  ½  VULGAR FRACTION ONE HALF
\or
%  190  ¾  VULGAR FRACTION THREE QUARTERS
\or
%  191  ¿  INVERTED QUESTION MARK
\or
%  192  À  LATIN CAPITAL LETTER A WITH GRAVE
\or
%  193  Á  LATIN CAPITAL LETTER A WITH ACUTE
\or
%  194  Â  LATIN CAPITAL LETTER A WITH CIRCUMFLEX
\or
%  195  Ã  LATIN CAPITAL LETTER A WITH TILDE
\or
%  196  Ä  LATIN CAPITAL LETTER A WITH DIAERESIS
\or
%  197  Å  LATIN CAPITAL LETTER A WITH RING ABOVE
\or
%  198  Æ  LATIN CAPITAL LETTER AE
\or
%  199  Ç  LATIN CAPITAL LETTER C WITH CEDILLA
\or
%  200  È  LATIN CAPITAL LETTER E WITH GRAVE
\or
%  201  É  LATIN CAPITAL LETTER E WITH ACUTE
\or
%  202  Ê  LATIN CAPITAL LETTER E WITH CIRCUMFLEX
\or
%  203  Ë  LATIN CAPITAL LETTER E WITH DIAERESIS
\or
%  204  Ì  LATIN CAPITAL LETTER I WITH GRAVE
\or
%  205  Í  LATIN CAPITAL LETTER I WITH ACUTE
\or
%  206  Î  LATIN CAPITAL LETTER I WITH CIRCUMFLEX
\or
%  207  Ï  LATIN CAPITAL LETTER I WITH DIAERESIS
\or
%  208  Ð  LATIN CAPITAL LETTER ETH
\or
%  209  Ñ  LATIN CAPITAL LETTER N WITH TILDE
\or
%  210  Ò  LATIN CAPITAL LETTER O WITH GRAVE
\or
%  211  Ó  LATIN CAPITAL LETTER O WITH ACUTE
\or
%  212  Ô  LATIN CAPITAL LETTER O WITH CIRCUMFLEX
\or
%  213  Õ  LATIN CAPITAL LETTER O WITH TILDE
\or
%  214  Ö  LATIN CAPITAL LETTER O WITH DIAERESIS
\or
\psLedMultiply   % 215  ×  MULTIPLICATION SIGN
\or
%  216  Ø  LATIN CAPITAL LETTER O WITH STROKE
\or
%  217  Ù  LATIN CAPITAL LETTER U WITH GRAVE
\or
%  218  Ú  LATIN CAPITAL LETTER U WITH ACUTE
\or
%  219  Û  LATIN CAPITAL LETTER U WITH CIRCUMFLEX
\or
%  220  Ü  LATIN CAPITAL LETTER U WITH DIAERESIS
\or
%  221  Ý  LATIN CAPITAL LETTER Y WITH ACUTE
\or
%  222  Þ  LATIN CAPITAL LETTER THORN
\or
%  223  ß  LATIN SMALL LETTER SHARP S
\or
%  224  à  LATIN SMALL LETTER A WITH GRAVE
\or
%  225  á  LATIN SMALL LETTER A WITH ACUTE
\or
%  226  â  LATIN SMALL LETTER A WITH CIRCUMFLEX
\or
%  227  ã  LATIN SMALL LETTER A WITH TILDE
\or
%  228  ä  LATIN SMALL LETTER A WITH DIAERESIS
\or
%  229  å  LATIN SMALL LETTER A WITH RING ABOVE
\or
%  230  æ  LATIN SMALL LETTER AE
\or
%  231  ç  LATIN SMALL LETTER C WITH CEDILLA
\or
%  232  è  LATIN SMALL LETTER E WITH GRAVE
\or
%  233  é  LATIN SMALL LETTER E WITH ACUTE
\or
%  234  ê  LATIN SMALL LETTER E WITH CIRCUMFLEX
\or
%  235  ë  LATIN SMALL LETTER E WITH DIAERESIS
\or
%  236  ì  LATIN SMALL LETTER I WITH GRAVE
\or
%  237  í  LATIN SMALL LETTER I WITH ACUTE
\or
%  238  î  LATIN SMALL LETTER I WITH CIRCUMFLEX
\or
%  239  ï  LATIN SMALL LETTER I WITH DIAERESIS
\or
%  240  ð  LATIN SMALL LETTER ETH
\or
%  241  ñ  LATIN SMALL LETTER N WITH TILDE
\or
%  242  ò  LATIN SMALL LETTER O WITH GRAVE
\or
 %  243  ó  LATIN SMALL LETTER O WITH ACUTE
\or
%  244  ô  LATIN SMALL LETTER O WITH CIRCUMFLEX
\or
%  245  õ  LATIN SMALL LETTER O WITH TILDE
\or
%  246  ö  LATIN SMALL LETTER O WITH DIAERESIS
\or
\psLedDivide % 247  ÷  DIVISION SIGN
\or
%  248  ø  LATIN SMALL LETTER O WITH STROKE
\or
%  249  ù  LATIN SMALL LETTER U WITH GRAVE
\or
%  250  ú  LATIN SMALL LETTER U WITH ACUTE
\or
%  251  û  LATIN SMALL LETTER U WITH CIRCUMFLEX
\or
%  252  ü  LATIN SMALL LETTER U WITH DIAERESIS
\or
%  253  ý  LATIN SMALL LETTER Y WITH ACUTE
\or
%  254  þ  LATIN SMALL LETTER THORN
\or
%  255  ÿ  LATIN SMALL LETTER Y WITH DIAERESIS
\else
% Default fallback
\fi
}%
```
