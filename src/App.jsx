import { useState } from "react";
import "./App.css";
import BookList from "./tags/BookList";
import BookForm from "./tags/BookForm";
import { BrowserRouter, Routes, Route, Link } from "react-router-dom";

function App() {
  return (
    <>
      <BrowserRouter>
        <nav>
          <Link to="/">도서목록</Link> |<Link to="/booksform">도서등록</Link> |
        </nav>
        <hr />
        <Routes>
          <Route path="/" element={<BookList />} />
          <Route path="/booksform" element={<BookForm />} />
        </Routes>
      </BrowserRouter>
    </>
  );
}

export default App;
