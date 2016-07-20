#include <stdio.h> 
#include <stdlib.h>
#define REG_NUM 100

char Registers[REG_NUM];
char RegPos = 0;//current register index
int ProgPos = 0; //current program character index


int main(int argc, char **argv)
{
	char * ProgName = argv[1];// assumes "BFParse FILE"
	FILE * ProgFile = fopen(ProgName, "r");
	if(!ProgFile)
	{
		printf("cannot open %s\n", ProgName);
		return -1;
	}
	printf("reached a\n");
	
	//find program length and read into dynamically allocated memory
	fseek(ProgFile, 0, SEEK_END);
	printf("reached d");
	long unsigned int FSize = ftell(ProgFile);
	fseek(ProgFile, 0, SEEK_SET);
	
	printf("reached b\n");
	
	char * Instructions = malloc(FSize + 1);
	fread(Instructions, FSize, 1, ProgFile);
	fclose(ProgFile);
	Instructions[FSize] = '\0';
	
	printf("istructions read are: \n%s\n", Instructions);
	
	//scrub non +-<>.,[] characters, shelve for now
	

	
	
	while (1)
	{
		
	
		//printf("current program character is %c\n", Instructions[ProgPos]);
		switch(Instructions[ProgPos]) 
		{	
			case '+': Registers[RegPos]++; break;
			case '-': Registers[RegPos]--; break;
			
			case '<': 
				if (RegPos == 0)//wraping
				{
					RegPos = REG_NUM -1;
				}
				else 
				{
					RegPos--;
				} 
				break;
				
			case '>':
				if (RegPos == (REG_NUM-1) )//wrapping
				{
					RegPos = 0;
				}
				else
				{
					RegPos++;
				}
				break;
			
			case '.': putchar(Registers[RegPos]); break;
			case ',': Registers[RegPos] = fgetc(stdin); break;
			
			case '\0': free(Instructions); printf("\n\nprogram finished without errors\n\n"); return 0;
			//default: printf("no action taken\n"); break;
		
		}
		ProgPos++;
	}
}
