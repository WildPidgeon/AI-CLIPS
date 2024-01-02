import clips
import tkinter as tk
outvar = ""

class UI:
    def __init__(self, file_path: str, ):
        self.env = clips.Environment()
        self.env.load(file_path)
        self.env.reset()
        self.choices = []
        self.label = ""
        self.state = ""

    def next_ui_state(self):
        polecenie = "(find-all-facts ((?f state-list)) TRUE)"
        identyfikator = dict(self.env.eval(polecenie)[0])["current"]
        polecenie = "(find-all-facts ((?f UI-state)) " + "(eq ?f:id " + identyfikator + "))"
        tmp = self.env.eval(polecenie)[0]
        valid_ans = dict(tmp)["valid-answers"]
        self.choices.clear()
        for i in range(len(valid_ans)):
            self.choices.append(valid_ans[i])
        text = dict(tmp)["display"]
        self.label = text
        print(text)
        self.state = dict(tmp)["state"]

        def wywolanieYES():
            root.destroy()
            self.action("next", self.choices[1])
        def wywolanieNO():
            root.destroy()
            self.action("next", self.choices[0])
        def wywolanieFinal():
            root.destroy()
            self.action("next", "")
        def wywolanieRESET():
            root.destroy()
            self.action("reset","")

        global outvar
        if dict(tmp)["state"] == "final":
            if outvar != self.label:
                outvar = self.label
                root = tk.Tk()
                root.title("What candy should I eat?")
                root.geometry("500x300")
                root.configure(bg="pink")
                l = tk.Label(root, text="Eat " + self.label + "\n", bg="pink")
                l.config(font=("Helvetica", 14))
                l.pack(side=tk.TOP, pady=20)
                frame = tk.Frame(root)
                frame.pack()
                bottomframe = tk.Frame(root)
                bottomframe.pack(side=tk.BOTTOM)
                otherbutton = tk.Button(frame, text='OTHER OPTIONS', width=25, command=wywolanieFinal)
                otherbutton.config(font=("Helvetica", 9))
                otherbutton.pack(side=tk.LEFT)
                ex = tk.Button(bottomframe, text="EXIT", command=root.destroy)
                res = tk.Button(bottomframe, text="RESET", command=wywolanieRESET)
                ex.config(font = ("Helvetica", 9))
                res.config(font = ("Helvetica", 9))
                ex.pack(side=tk.LEFT)
                res.pack(side=tk.LEFT)
                root.mainloop()

            else:
                root = tk.Tk()
                root.title("What candy should I eat?")
                root.geometry("500x300")
                root.configure(bg="pink")
                l = tk.Label(root, text="There are no other options. Try again.", bg="pink")
                l.config(font=("Helvetica", 14))
                l.pack(side=tk.TOP, pady=70)
                frame = tk.Frame(root)
                frame.pack()
                bottomframe = tk.Frame(root)
                bottomframe.pack(side=tk.BOTTOM)
                ex = tk.Button(bottomframe, text="EXIT", command=root.destroy)
                res = tk.Button(bottomframe, text="RESET", command=wywolanieRESET)
                ex.config(font = ("Helvetica", 9))
                res.config(font = ("Helvetica", 9))
                ex.pack(side=tk.LEFT)
                res.pack(side=tk.LEFT)
                root.mainloop()

        elif dict(tmp)["state"] == "initial":
            root = tk.Tk()
            root.title("What candy should I eat?")
            root.geometry("500x300")
            root.configure(bg="pink")
            l = tk.Label(root, text=self.label + "\n", bg="pink")
            l.config(font=("Helvetica", 14))
            l.pack(side=tk.TOP, pady=20)  
            frame = tk.Frame(root)
            frame.pack()
            bottomframe = tk.Frame(root)
            bottomframe.pack(side=tk.BOTTOM)
            startbutton = tk.Button(frame, text='START', width=25, command=wywolanieFinal)
            startbutton.config(font=("Helvetica", 9))
            startbutton.pack(side=tk.TOP)  
            ex = tk.Button(bottomframe, text="EXIT", command=root.destroy)
            ex.config(font = ("Helvetica", 9))
            ex.pack()
            root.mainloop()

        else:
            root = tk.Tk()
            root.title("What candy should I eat?")
            root.geometry("500x300")
            root.configure(bg="pink")
            T = tk.Label(root, text= self.label+ "\n", bg="pink")
            T.config(font=("Helvetica", 14))
            T.pack(side=tk.TOP, pady=20)
            frame = tk.Frame(root)
            frame.pack()
            bottomframe = tk.Frame(root)
            bottomframe.pack(side=tk.BOTTOM)
            bottomframe = tk.Frame(root)
            bottomframe.pack(side=tk.BOTTOM)
            greenbutton = tk.Button(frame, text=self.choices[1], fg='green', width=25, command=wywolanieYES)
            greenbutton.config(font=("Helvetica", 9, "bold"))
            greenbutton.pack(side=tk.LEFT)
            redbutton = tk.Button(frame, text=self.choices[0], fg='red', width=25, command=wywolanieNO)
            redbutton.config(font=("Helvetica", 9, "bold"))
            redbutton.pack(side=tk.LEFT)
            ex = tk.Button(bottomframe, text="EXIT", command=root.destroy)
            res = tk.Button(bottomframe, text="RESET", command=wywolanieRESET)
            ex.config(font = ("Helvetica", 9))
            res.config(font = ("Helvetica", 9))
            ex.pack(side=tk.LEFT)
            res.pack(side=tk.LEFT)
            root.mainloop()

    def action(self, button: str, response: str):
        polecenie = "(find-all-facts ((?f state-list)) TRUE)"
        identyfikator = dict(self.env.eval(polecenie)[0])["current"]
        polecenie = "(find-all-facts ((?f UI-state)) " + "(eq ?f:id " + identyfikator + "))"
        tmp = self.env.eval(polecenie)[0]
        if button == "next" and dict(tmp)["state"] != "initial":
            polecenie = f"(assert (next {identyfikator} {response}))"
            self.env.eval(polecenie)
        elif button == "next" and dict(tmp)["state"] == "initial":
            polecenie = f"(assert (next {identyfikator}))"
            self.env.eval(polecenie)
        elif button == "reset":
            self.env.reset()
        self.run()

    def run(self):
        self.env.run()
        self.next_ui_state()


ui = UI("candy.clp")
ui.run()