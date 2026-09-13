{
  programs.nixvim.plugins = {
    treesitter = {
      enable = true;
      nixvimInjections = true;
      settings = {
        highlight.enable = true;
        folding.enable = true;
        indent.enable = true;
      };
    };

    lsp = {
      enable = true;

      keymaps = {
        silent = true;
        diagnostic = {
          "[d" = "goto_prev";
          "]d" = "goto_next";
          "<leader>e" = "open_float";
        };
        lspBuf = {
          "gd" = "definition";
          "gD" = "declaration";
          "gr" = "references";
          "gi" = "implementation";
          "K" = "hover";
          "<leader>cr" = "rename";
          "<leader>ca" = "code_action";
          "<leader>cf" = "format";
        };
      };

      servers = {
        # Python: Pyright for type checking and analysis, Ruff for linting and code actions
        pyright.enable = true;
        ruff.enable = true;

        # Nix: nixd for language features and formatting
        nixd = {
          enable = true;
          settings = {
            formatting.command = [ "nixfmt" ];
            nixpkgs.expr = "import <nixpkgs> { }";
          };
        };

        # YAML: yamlls with schema support
        yamlls = {
          enable = true;
          settings = {
            yaml = {
              schemas = {
                "https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json" = "docker-compose*.{yml,yaml}";
                "https://raw.githubusercontent.com/SchemaStore/schemastore/master/src/schemas/json/github-workflow.json" = ".github/workflows/*";
                "https://raw.githubusercontent.com/SchemaStore/schemastore/master/src/schemas/json/github-action.json" = ".github/action.{yml,yaml}";
                "https://raw.githubusercontent.com/SchemaStore/schemastore/master/src/schemas/json/kustomization.json" = "kustomization.{yml,yaml}";
                "https://raw.githubusercontent.com/SchemaStore/schemastore/master/src/schemas/json/gitlab-ci.json" = ".gitlab-ci.yml";
              };
              validate = true;
              completion = true;
              hover = true;
            };
          };
        };
      };
    };

    lsp-lines.enable = true;
    lsp-format.enable = true;
  };
}
