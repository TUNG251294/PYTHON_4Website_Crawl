import { CssBaseline, ThemeProvider } from "@mui/material";
import { createTheme } from "@mui/material";
import { BrowserRouter, Navigate, Route, Routes } from "react-router-dom";
import { useMemo } from "react";
import Layout from "scenes/layout";
import { themeSettings } from "theme";
import { useSelector } from "react-redux";
import Search from "scenes/hasaki/search";
import List from "scenes/hasaki/listHasaki";
import SearchPharmacity from "scenes/pharmacity/searchPharmacity";
import ListPharmacity from "scenes/pharmacity/listPharmacity";
import ListGuardian from "scenes/guardian/listGuardian";
import SearchGuardian from "scenes/guardian/searchGuardian";
import SearchWatson from "scenes/watson/searchWatson";
import ListWatson from "scenes/watson/listWatson";
import CrawlControl from "scenes/crawl/control";
import Login from "scenes/login";

function App() {
  const mode = useSelector((state) => state.global.mode);
  const theme = useMemo(() => createTheme(themeSettings(mode)), [mode]);
  return (
    <div className="app">
      <BrowserRouter>
        <ThemeProvider theme={theme}>
          <CssBaseline />
          <Routes>
            <Route path="/" element={<Login />} />
            <Route element={<Layout />}>
              <Route path="/" element={<Login />} />
              <Route path="/hasaki/search" element={<Search />} />
              <Route path="/hasaki" element={<List />} />
              <Route path="/pharmacity/search" element={<SearchPharmacity />} />
              <Route path="/pharmacity" element={<ListPharmacity />} />
              <Route path="/guardian/search" element={<SearchGuardian />} />
              <Route path="/guardian" element={<ListGuardian />} />
              <Route path="/watson/search" element={<SearchWatson />} />
              <Route path="/watson" element={<ListWatson />} />
              <Route path="crawl/options" element={<CrawlControl />} />
            </Route>
          </Routes>
        </ThemeProvider>
      </BrowserRouter>
    </div>
  );
}


export default App;
