<?php

namespace App\Command;

use App\Request\AdminCreateRequest;
use App\Service\AdminServiceInterface;
use Symfony\Component\Console\Command\Command;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Output\OutputInterface;
use Symfony\Component\Console\Style\SymfonyStyle;

class CreateSuperAdminCommand extends Command
{
    protected static $defaultName = 'app:create-super-admin';

    private $adminService;

    public function __construct(AdminServiceInterface $adminService)
    {
        $this->adminService = $adminService;
        
        parent::__construct();
    }

    public function superAdminData()
    {
         $data = new AdminCreateRequest();

         $data->setUserID('sa1');
         $data->setUserName("supAdmin1");
         $data->setPassword('000');
         $data->setRoles(['ROLE_SUPER_ADMIN']);

         return $data;
    }

    protected function configure()
    {
        $this
            ->setDescription('Create a new super admin user.')
            ->setHelp('This command allows you to create a new super admin user...')
        ;
    }

    protected function execute(InputInterface $input, OutputInterface $output)
    {
        // this method must return an integer number with the "exit status code"
        // of the command. You can also use these constants to make code more readable

        $io = new SymfonyStyle($input, $output);

        $message = "Creating a user with super admin privileges, please wait..";
        $output->writeln($message);
        $io->newLine();

        $data = $this->superAdminData();

        $this->adminService->adminCreate($data);

        $io->progressAdvance();

        $io->newLine();

        $message = "Super Admin had been created successfully!";

        $output->writeln($message);

        $io->newLine();

        return 0;
    }

}