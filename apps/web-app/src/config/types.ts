//import type { SnackbarProps } from 'notistack';

type Notifications = {
  options: {
    anchorOrigin: {
      vertical: string;
      horizontal: string;
    };
    autoHideDuration: number;
  };
  maxSnack: number;
};

export type { Notifications };
