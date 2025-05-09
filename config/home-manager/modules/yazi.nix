{ config, pkgs, ... }: {

  programs.yazi = {
    enable = true;
    settings = {
      log = { enabled = false; };
      manager = {
        show_hidden = false;
        sort_by = "modified";
        sort_dir_first = true;
        sort_reverse = true;
      };
    };
  };
}
