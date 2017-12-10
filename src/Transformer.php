<?php

class Transformer
{
    /**
     * @var string
     */
    private $xmlPath;
    /**
     * @var string
     */
    private $outputPath;

    /**
     * @inheritdoc
     */
    public function __construct($xmlPath)
    {
        $this->xmlPath = $xmlPath;
        $this->outputPath = dirname($xmlPath) . DIRECTORY_SEPARATOR . 'out';
    }

    public function run()
    {
        $xslt = new DOMDocument();
        $xslt->load(dirname(__DIR__) . DIRECTORY_SEPARATOR . 'src' . DIRECTORY_SEPARATOR . 'ProcessPositionOpeningTransform.xslt');

        $xsltProcessor = new XSLTProcessor();
        $xsltProcessor->importStylesheet($xslt);

        $xml = new DOMDocument();

        $rdi = new RecursiveDirectoryIterator($this->xmlPath, FilesystemIterator::SKIP_DOTS);
        $rii = new RecursiveIteratorIterator($rdi);
        foreach ($rii as $path => $splFile) {
            /**
             * @var string $path
             * @var SplFileInfo $splFile
             */
            $xml->load($path);
            @file_put_contents($this->getOutputPath() . DIRECTORY_SEPARATOR . $splFile->getFilename(), $xsltProcessor->transformToXml($xml));
        }
    }

    /**
     * @return string
     */
    public function getXmlPath(): string
    {
        return $this->xmlPath;
    }

    /**
     * @return string
     */
    public function getOutputPath(): string
    {
        return $this->outputPath;
    }
}
