package pro.lavrinov.javarushCrudTest.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import pro.lavrinov.javarushCrudTest.model.Book;
import pro.lavrinov.javarushCrudTest.service.BookService;

@Controller
@RequestMapping
public class BookController {
    private BookService bookService;

    @Autowired
    @Qualifier(value = "bookService")
    public void setBookService(BookService bookService) {
        this.bookService = bookService;
    }

    @RequestMapping(value = "/books",method = RequestMethod.GET)
    public String listBooks(Model model){
        model.addAttribute("book", new Book());
        model.addAttribute("listBooks",this.bookService.listBooks());

        return "books";
    }

    @RequestMapping(value = "/books/add",method = RequestMethod.POST)
    public String addBook(@ModelAttribute("book") Book book){
        if(book.getId() == 0){
            this.bookService.addBook(book);
        } else {
            this.bookService.updateBook(book);
        }

        return "redirect:/books";
    }

    @RequestMapping(value = "/remove/{id}")
    public String removeBook(@PathVariable("id")  int id){
        this.bookService.removeBook(id);

        return "redirect:/books";
    }

    @RequestMapping(value = "/edit/{id}")
    public String editBook(@PathVariable("id")  int id ,Model model){
        model.addAttribute("book", this.bookService.getBookById(id));
        model.addAttribute("listBooks",this.bookService.listBooks());

        return "books";
    }

    @RequestMapping(value = "/read/{id}")
    public String editReadBook(@PathVariable("id")  int id ,Model model){
        Book book = this.bookService.getBookById(id);
        book.setReadAlready(true);
        model.addAttribute("book", book);
        model.addAttribute("listBooks",this.bookService.listBooks());

        return "books";
    }
}
