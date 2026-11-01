# LBYARCH Programming Project

GitHub Repository for x86-64 Integer Programming Project in LBYARCH Course from CCS in DLSU from Term 1 AY 2026-2027

- This Program is Made, Compiled and Run in SASM

## Project Specifications

Develop an x86-64 program that can perform XOR Fibonacci Encryption/Decryption.  

In an XOR encryption system, each character in a string is XOR-ed with a key. The resulting encrypted string can simply be decrypted by performing the XOR operation with the same key.  

For example, given the input text "Hello" and the key (in hex) "1A 2B 3C 4D 5E":  

Encryption process  

&emsp; &emsp; Input Text = **48 65 6C 6C 6F** (*"Hello"* in ASCII)  
&emsp; &emsp; Key = **1A 2B 3C 4D 5E**  
&emsp; &emsp; Encrypted Text = **52 4E 50 21 31** (*"RNP!1"* in ASCII)  

Decryption process  

&emsp; &emsp; Input Text = **52 4E 50 21 31** (*"RNP!1"* in ASCII)  
&emsp; &emsp; Key = **1A 2B 3C 4D 5E**  
&emsp; &emsp; Decrypted Text = **48 65 6C 6C 6F** (*"Hello"* in ASCII)  

Observe how the key is given, and how it must remain consistent between encryption and decryption processes.  

In an XOR Fibonacci encryption, the key depends on the Fibonacci sequence. The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding numbers. Typically, the sequence begins with the numbers 0 and 1. However, in this case, let the user decide on the two starting numbers, **n0** and **n1**, both of which are to be declared in memory and limited to the size of a byte. Throughout the sequence, let each element in the sequence be truncated to 8 bits. Lastly, the length of the sequence to be generated should match the length of the input text to be encrypted/decrypted (not including the null terminating character).  

Note: Do not include the null terminating character as part of the encryption and decryption process.  

For example, let **n0** and **n1** be **74** and **108**, respectively (in decimal), where the input text is "LBYARCH". Since the input text is seven characters long, the key is "**4A 6C B6 22 D8 FA D2**" (in hex) since:  

| Sequence Number  | Sequence Value (in DEC) | Sequence Value (in HEX) | 
|:----------------:|:-----------------------:|:-----------------------:|
|         1        |            74           |            4A           |
|         2        |            108          |            6C           |
|         3        |            182          |            B6           |
|         4        |            34           |            22           |
|         5        |            216          |            D8           |
|         6        |            250          |            FA           |
|         7        |            210          |            D2           |

To summarize the requirements of this program, let the user define the following in memory: input string, n0, and n1. You may assume that the length of the input string is limited to 20 characters. Let the program provide an output following the format below:  

&emsp; &emsp; Input Text (in ASCII)  
&emsp; &emsp; Input Text (in HEX, each character separated by a space)  
&emsp; &emsp; Key (in HEX, each character separated by a space)  
&emsp; &emsp; Encrypted Text (in Hex, each character separated by a space)  
&emsp; &emsp; Encrypted Text (in ASCII)  

You may refer to the following examples:  

Input (in memory):  

&emsp; &emsp; Text = "Assembly"  
&emsp; &emsp; n0 = 25  
&emsp; &emsp; n1 = 138  

Output:  

&emsp; &emsp; Assembly  
&emsp; &emsp; 41 73 73 65 6D 62 6C 79  
&emsp; &emsp; 19 8A A3 2D D0 FD CD CA   
&emsp; &emsp; 58 F9 D0 48 BD 9F A1 B3  
&emsp; &emsp; XùÐH½Ÿ¡³