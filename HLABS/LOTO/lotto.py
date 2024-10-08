from random import randint

def lotto(choice=6, total=52) -> None:
    print(
f"******************************* \n"
f"*      Welcome to Lotto !     * \n"
f"*      choose 6 numbers       * \n"
f"*       between 1 to 52       * \n"
f"*        Five numbers         * \n"
f"*            can              * \n"
f"*       change your life      * \n"
f"******************************* \n"  , sep='')
    your_nums = []
    for i in range(choice):
        try:
            print(f"input num[{i}]: ", end="")
            your_nums.append(int(input()))
        except:
            print("don't hack it.")
            return

    jackpot = [randint(1, total) for i in range(choice)]
    cnt = 0
    for i in your_nums:
        if i in jackpot:
            cnt += 1

    print("*" * 24)
    print(jackpot)
    print("*" * 24)

    if cnt == choice:
        print("jackpot!")
        with open("flag.txt", "r") as f:
            print(f.read())

    else:
        print("sorry... you lose !")

if __name__ == "__main__":
    lotto(6, 52)