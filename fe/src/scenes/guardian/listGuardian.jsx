import axios from "axios";
import React, { useEffect, useState } from "react";
import {
  Box,
  Button,
  Grid,
  TextField,
  useTheme,
  CircularProgress,
} from "@mui/material";
import { DataGrid } from "@mui/x-data-grid";
import Header from "components/Header";
import { ToastContainer, toast } from "react-toastify";
import "react-toastify/dist/ReactToastify.css";
import { API_BASE_URL } from "../api/api.jsx";

function Search() {
  const authToken = JSON.parse(JSON.stringify(localStorage.getItem("token")));
  const [form, setForm] = useState({});
  const [loading, setLoading] = useState(false);
  const handleChange = (e) => {
    setForm({
      ...form,
      [e.target.name]: e.target.value,
    });
  };
  const handleKeyDown = (event) => {
    if (event.key === "Enter") {
      setLoading(true);
    }
  };
  const handleSubmit = async (e) => {
    setLoading(true);
    if (!form.search) {
      toast.error("Bạn vui lòng nhập từ khóa vào ô search!", {
        position: toast.POSITION.TOP_CENTER,
        autoClose: 3000,
        hideProgressBar: true,
      });
    } else {
      setLoading(true);
    }
  };

  const [paginationModel, setPaginationModel] = React.useState({
    pageSize: 10,
    page: 0,
  });
  const [totalRows, setTotalRows] = useState(0);
  const theme = useTheme();
  const [data, setData] = useState([]);

  useEffect(() => {
    fetchData();
  }, [paginationModel.page, paginationModel.pageSize, loading]);

  const fetchData = async () => {
    try {
      const skip = paginationModel.page * paginationModel.pageSize;
      const limit = paginationModel.pageSize;
      const search = form.search;
      const response = await axios.get(API_BASE_URL + "/guardian", {
        params: {
          skip,
          limit,
          name: `${search}`,
        },
        headers: {
          Authorization: `Bearer ${authToken}`,
        },
      });
      setData(response.data.listGuardian);
      setTotalRows(response.data.count);
      setLoading(false);
    } catch (error) {
      console.log(error.message);
      if (error.message === "Request failed with status code 403") {
        window.location.reload();
      } else {
        toast.error(error.code, {
          position: toast.POSITION.TOP_CENTER,
          autoClose: 3000,
          hideProgressBar: true,
        });
      }
    }
    setLoading(false);
  };

  const columns = [
    {
      field: "id",
      headerName: "#",
      flex: 0.1,
      align: "center",
      headerAlign: "center",
    },
    {
      field: "name",
      headerName: "Name",
      flex: 0.8,
    },
    {
      field: "price",
      headerName: "Price",
      flex: 0.2,
    },
    {
      field: "original_price",
      headerName: "Original price",
      flex: 0.2,
    },
    {
      field: "status",
      headerName: "Status",
      flex: 0.2,
    },
  ];

  return (
    <>
      <Box m="1.5rem 2.5rem" maxWidth={"170vh"}>
        <ToastContainer />
        <Header title="GUARDIAN" subtitle="List Guardian" />
        <Box
          mt="40px"
          height="75vh"
          sx={{
            "& .MuiDataGrid-root": {
              border: "none",
            },
            "& .MuiDataGrid-cell": {
              borderBottom: "none",
            },
            "& .MuiDataGrid-columnHeaders": {
              backgroundColor: theme.palette.background.alt,
              color: theme.palette.secondary[100],
              borderBottom: "none",
            },
            "& .MuiDataGrid-virtualScroller": {
              backgroundColor: theme.palette.primary.light,
            },
            "& .MuiDataGrid-footerContainer": {
              backgroundColor: theme.palette.background.alt,
              color: theme.palette.secondary[100],
              borderTop: "none",
            },
            "& .MuiDataGrid-toolbarContainer .MuiButton-text": {
              color: `${theme.palette.secondary[200]} !important`,
            },
            "& .image": {
              borderRadius: "50%",
            },
            "& .MuiDataGrid-checkboxInput.Mui-checked": {
              color: "white",
            },
            "& .css-kg2jkk-MuiDataGrid-root": {
              maxWidth: "1189.2px",
              maxHeight: "559.2px",
            },
          }}
        >
          <Grid item xs={10} sm={8} md={6} lg={4}>
            <Box sx={{ mb: 3 }}>
              <TextField
                fullWidth
                label="Search"
                name="search"
                onChange={handleChange}
                variant="outlined"
                size="small"
                onKeyDown={handleKeyDown}
              />
            </Box>
            <Box sx={{ mb: 3 }}>
              <Button
                variant="contained"
                color="primary"
                onClick={handleSubmit}
                sx={{ mr: 2 }}
                disabled={loading}
              >
                {loading ? <CircularProgress size={24} /> : "Search"}
              </Button>
            </Box>
          </Grid>
          <DataGrid
            rows={data ? data : []}
            columns={columns}
            paginationModel={paginationModel}
            onPaginationModelChange={setPaginationModel}
            pageSizeOptions={[10, 20, 30]}
            rowCount={totalRows}
            paginationMode="server"
          />
        </Box>
      </Box>
    </>
  );
}

export default Search;
