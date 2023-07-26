import React from "react";
import {
  Box,
  Collapse,
  Divider,
  Drawer,
  IconButton,
  List,
  ListItem,
  ListItemButton,
  ListItemIcon,
  ListItemText,
  Typography,
  useTheme,
} from "@mui/material";
import {
  SettingsOutlined,
  ChevronLeft,
  ChevronRightOutlined,
  HomeOutlined,
  ShoppingCartOutlined,
  Groups2Outlined,
  ReceiptLongOutlined,
  PointOfSaleOutlined,
  TodayOutlined,
  CalendarMonthOutlined,
  AdminPanelSettingsOutlined,
  TrendingUpOutlined,
  PieChartOutlined,
  ExpandMore,
  MenuBookRounded,
  AddCircleRounded,
  ListAltRounded,
  Person4Outlined,
  SearchRounded,
} from "@mui/icons-material";
import { useEffect, useState } from "react";
import { useLocation, useNavigate } from "react-router-dom";
import FlexBetween from "./FlexBetween";
import profileImage from "assets/profile.jpeg";

const Sidebar = ({
  user,
  drawerWidth,
  isSidebarOpen,
  setIsSidebarOpen,
  isNonMobile,
}) => {
  const { pathname } = useLocation();
  const [active, setActive] = useState("");
  const navigate = useNavigate();
  const theme = useTheme();
  const [hasakiOpen, setHasakiOpen] = useState(false);
  const [pharmacityOpen, setPharmacityOpen] = useState(false);
  const [guardianOpen, setGuardian] = useState(false);
  const [watsonOpen, setWatsonOpen] = useState(false);
  const [crawlOpen, setCrawlOpen] = useState(false);

  const navItems = [
    {
      text: "Client Facing",
      icon: null,
    },
    {
      text: "Hasaki",
      icon: <ShoppingCartOutlined />,
      state: hasakiOpen,
      children: [
        {
          text: "Search Hasaki",
          icon: <SearchRounded />,
          link: "hasaki/search",
        },
        {
          text: "Hasaki List",
          icon: <ListAltRounded />,
          link: "hasaki",
        },
      ],
    },
    {
      text: "Pharmacity",
      icon: <ShoppingCartOutlined />,
      state: pharmacityOpen,
      children: [
        {
          text: "Search Pharmacity",
          icon: <SearchRounded />,
          link: "pharmacity/search",
        },
        {
          text: "List Pharmacity",
          icon: <ListAltRounded />,
          link: "pharmacity",
        },
      ],
    },
    {
      text: "Guardian",
      icon: <ShoppingCartOutlined />,
      state: guardianOpen,
      children: [
        {
          text: "Search Guardian",
          icon: <SearchRounded />,
          link: "guardian/search",
        },
        {
          text: "List Guardian",
          icon: <ListAltRounded />,
          link: "guardian",
        },
      ],
    },
    {
      text: "Watson",
      icon: <ShoppingCartOutlined />,
      state: watsonOpen,
      children: [
        {
          text: "Search Watson",
          icon: <SearchRounded />,
          link: "watson/search",
        },
        {
          text: "List Watson",
          icon: <ListAltRounded />,
          link: "watson",
        },
      ],
    },
    {
      text: "Crawl Tool",
      icon: null,
    },
    {
      text: "Crawl",
      icon: <ShoppingCartOutlined />,
      state: crawlOpen,
      children: [
        {
          text: "Crawl Setting",
          icon: <AddCircleRounded />,
          link: "crawl/options",
        },
      ],
    },
  ];

  const handleHasakiDropDown = () => {
    setHasakiOpen(!hasakiOpen);
  };
  const handlePharmacityDropDown = () => {
    setPharmacityOpen(!pharmacityOpen);
  };
  const handleGuardianDropDown = () => {
    setGuardian(!guardianOpen);
  };
  const handleWatsonDropDown = () => {
    setWatsonOpen(!watsonOpen);
  };
  const handleCrawlDropDown = () => {
    setCrawlOpen(!crawlOpen);
  };

  useEffect(() => {
    setActive(pathname.substring(1));
  }, [pathname]);

  return (
    <Box component="nav">
      {isSidebarOpen && (
        <Drawer
          open={isSidebarOpen}
          onClose={() => setIsSidebarOpen(false)}
          variant="persistent"
          anchor="left"
          sx={{
            width: drawerWidth,
            "& .MuiDrawer-paper": {
              color: theme.palette.secondary[200],
              backgroundColor: theme.palette.background.alt,
              boxSixing: "border-box",
              borderWidth: isNonMobile ? 0 : "2px",
              width: drawerWidth,
            },
            "& .MuiPaper-root::-webkit-scrollbar": {
              overflowY: "hidden",
            },
          }}
        >
          <Box width="100%">
            <Box m="1.5rem 2rem 2rem 3rem">
              <FlexBetween color={theme.palette.secondary.main}>
                <Box display="flex" alignItems="center" gap="0.5rem">
                  <Typography variant="h4" fontWeight="bold">
                  MEGASOP CRAWL DATA
                  </Typography>
                </Box>
                {!isNonMobile && (
                  <IconButton onClick={() => setIsSidebarOpen(!isSidebarOpen)}>
                    <ChevronLeft />
                  </IconButton>
                )}
              </FlexBetween>
            </Box>
            <List>
              {navItems.map(({ text, icon, children, state }) => {
                if (!icon) {
                  return (
                    <Typography key={text} sx={{ m: "1rem 0 1rem 3rem" }}>
                      {text}
                    </Typography>
                  );
                }
                const lcText = text;
                const childItems = children
                  ? children.map((child) => ({
                      text: child.text,
                      link: child.link,
                      active: active === child.text,
                    }))
                  : null;

                return (
                  <List key={text}>
                    <ListItem key={text} disablePadding>
                      <ListItemButton
                        onClick={() => {
                          if (!children) {
                            navigate(`/${lcText}`);
                            children ? setActive("") : setActive(lcText);
                          } else {
                            if (text === "Hasaki") {
                              handleHasakiDropDown();
                            } else if (text === "Guardian") {
                              handleGuardianDropDown();
                            } else if (text === "Pharmacity") {
                              handlePharmacityDropDown();
                            } else if (text === "Watson") {
                              handleWatsonDropDown();
                            } else if (text === "Crawl") {
                              handleCrawlDropDown();
                            }
                          }
                        }}
                        sx={{
                          backgroundColor:
                            active === lcText
                              ? theme.palette.secondary[300]
                              : "transparent",
                          color:
                            active === lcText
                              ? theme.palette.primary[600]
                              : theme.palette.secondary[100],
                        }}
                      >
                        <ListItemIcon
                          sx={{
                            ml: "2rem",
                            color:
                              active === lcText
                                ? theme.palette.primary[600]
                                : theme.palette.secondary[200],
                          }}
                        >
                          {icon}
                        </ListItemIcon>
                        <ListItemText primary={text} />
                        {children ? <ExpandMore /> : ""}
                        {active === lcText && (
                          <ChevronRightOutlined sx={{ ml: "auto" }} />
                        )}
                      </ListItemButton>
                    </ListItem>
                    {childItems && (
                      <>
                        {childItems.map((child, index) => (
                          <Collapse
                            key={index}
                            in={state}
                            timeout="auto"
                            unmountOnExit
                          >
                            <List component="div" disablePadding>
                              <ListItemButton
                                onClick={() => {
                                  setActive(child.link);
                                  navigate(`/${child.link}`);
                                }}
                                sx={{
                                  backgroundColor:
                                    active === child.link
                                      ? theme.palette.secondary[300]
                                      : "transparent",
                                  color:
                                    active === child.link
                                      ? theme.palette.primary[600]
                                      : theme.palette.secondary[100],
                                }}
                              >
                                <ListItemIcon sx={{ ml: "3rem" }}>
                                  {children[index].icon}
                                </ListItemIcon>
                                <ListItemText
                                  primary={child.text}
                                  sx={{ ml: "-1rem" }}
                                />
                              </ListItemButton>
                            </List>
                          </Collapse>
                        ))}
                      </>
                    )}
                  </List>
                );
              })}
            </List>
          </Box>

          {/* <Box position="absolute" bottom="2rem"> */}
          {/* <Box>
            <Divider />
            <FlexBetween textTransform="none" gap="1rem" m="1.5rem 2rem 0 3rem">
              <Box
                component="img"
                alt="profile"
                src={profileImage}
                height="40px"
                width="40px"
                borderRadius="50%"
                sx={{ objectFit: "cover" }}
              />
              <Box textAlign="left">
                <Typography
                  fontWeight="bold"
                  fontSize="0.9rem"
                  sx={{ color: theme.palette.secondary[100] }}
                >
                  {user.name}
                </Typography>
                <Typography
                  fontSize="0.8rem"
                  sx={{ color: theme.palette.secondary[200] }}
                >
                  {user.occupation}
                </Typography>
              </Box>
              <SettingsOutlined
                sx={{
                  color: theme.palette.secondary[300],
                  fontSize: "25px ",
                }}
              />
            </FlexBetween>
          </Box> */}
        </Drawer>
      )}
    </Box>
  );
};

export default Sidebar;
