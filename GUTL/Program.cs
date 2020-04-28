namespace GUTL
{
    using Gtk;
    using System;
 
    class Hello {
 
        static void Main()
        {
            Application.Init ();
 
            Button btn = new Button ("Hola, Presione este boton para salir!!!!!!");
            btn.Clicked += new EventHandler (hello);
 
            Window window = new Window ("helloworld");
            window.SetSizeRequest(300, 300);
            window.DeleteEvent += delete_event;
 
            window.Add (btn);
            window.ShowAll ();
 
            Application.Run ();
        }
 
 
        // runs when the user deletes the window using the "close
        // window" widget in the window frame.
        static void delete_event (object obj, DeleteEventArgs args)
        {
            Application.Quit ();
        }
 
        // runs when the button is clicked.
        static void hello (object obj, EventArgs args)
        {
            Console.WriteLine("Hello World");
            Application.Quit ();
        }
    }
}